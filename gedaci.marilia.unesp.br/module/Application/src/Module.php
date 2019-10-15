<?php
/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Application;

use Application\Classes\Funcoes;
use Zend\Http\PhpEnvironment\RemoteAddress;
use Zend\ModuleManager\ModuleManager;
use Zend\Mvc\ModuleRouteListener;
use Zend\Mvc\MvcEvent;
use Zend\Session\Config\SessionConfig;
use Zend\Session\Container;
use Zend\Session\SessionManager;

class Module
{
    const VERSION = '3.0.3-dev';
        
    public function onBootstrap(MvcEvent $e) {
        $eventManager = $e->getApplication()->getEventManager();
        $moduleRouteListener = new ModuleRouteListener();
        $moduleRouteListener->attach($eventManager);

        //SET TERMINAL NAS PAGINAS 404
        $eventManager->attach(MvcEvent::EVENT_DISPATCH_ERROR, array($this, 'onDispatchError'));
       
        // Para disparar apenas quanto tem ViewModel.
        // ex: normal dispara a requisicao e renderiza por todo processo(verificaAutenticacao), caso deseje que nÃƒÂ£o possua ViewModel (XHR) nÃƒÂ£o verificaAutenticao, habilite aqui. 
        // ou seja, somente dispara quanto tem ViewModel
//        $eventManager->attach(MvcEvent::EVENT_DISPATCH, array($this, 'verificaAutenticacao'));
        
//        echo "<pre style='background-color: black; color: orange'>";
//        var_dump('onBootstrap');
//        echo "</pre>";
    }

    public function initSession($config) {
        $sessionConfig = new SessionConfig();
        $sessionConfig->setOptions($config);
        $sessionManager = new SessionManager($sessionConfig);
        $sessionManager->start();
        Container::setDefaultManager($sessionManager);
    }
    
    public function getConfig()
    {
        return include __DIR__ . '/../config/module.config.php';
    }
    
    public function init(ModuleManager $moduleManager) {
        $sharedEvents = $moduleManager->getEventManager()->getSharedManager();     
        $sharedEvents->attach('Zend\Mvc\Controller\AbstractActionController', MvcEvent::EVENT_DISPATCH, array($this, 'verificaAutenticacao'), 1);
        $sharedEvents->attach('Zend\Mvc\Controller\AbstractActionController', MvcEvent::EVENT_DISPATCH, array($this, 'layout'), 1);
        $sharedEvents->attach('Zend\Mvc\Controller\AbstractActionController', MvcEvent::EVENT_DISPATCH, array($this, 'onDispatchError'), 2);
        
    }
    
    public function onDispatchError(MvcEvent $event){
        
        $controller = $event->getTarget(); 
        //$nome_controller = $controller->getEvent()->getRouteMatch()->getParam('controller');
        
         $response = $event->getResponse();
         
        $view = $event->getViewModel();
        switch ($response->getStatusCode()) {
            case 404:
                $view->setTemplate('layout/layout_limpo');
                $view->setVariable('titulo_da_pagina', 'Error 404');
                break;
            case 500:
                $view->setTemplate('layout/layout_limpo');
//                $result = $event->getResult();
//                $result->setVariable('error', ini_get('display_errors'));                                                                
                $view->setVariable('titulo_da_pagina', 'Error 500');
                break;
        }
    }
    
    public function verificaAutenticacao($e){
        $sessao = new Container('usuario');
        
        $ip = new RemoteAddress();
        
        $request = $e->getRequest();
        
        $controller = $e->getTarget();  
        $nome_controller = $controller->getEvent()->getRouteMatch()->getParam('controller');
        $action = $controller->getEvent()->getRouteMatch()->getParam('action');
        
        $pagina = strtok($_SERVER["REQUEST_URI"],'?');
        
        $funcoes = new Funcoes($controller);
        
        $nao_verifica_sessao = array(
            'Login\Controller\LoginController',
            'Cadastro\Controller\CadastroController'
        );
        
        $layout_limpo = array(
            'Login\Controller\LoginController',
            'Cadastro\Controller\CadastroController',
        );
        
        if($sessao->situacao == 1){ //bloquear em questionario inicial
            $pre_cadastro_actions_permitidas = array(
                'bem-vindo',
                'inicial',
                'debug'
            );
        }
        
        if($sessao->situacao == 2){ //bloquear em meu perfil
            $pre_cadastro_actions_permitidas = array(
                'bem-vindo',
                'perfil',
                'debug'
            );
        }
        
        $params = $controller->params()->fromPost();
        
        //get cod aplicacao
        $sql = "select cod_aplicacao from sys_aplicacoes where link=:pagina";
        $aplicacao = $funcoes->executarSQL($sql, array('pagina' => $pagina), '');
        
        //log acessos
        $sql = "insert into sys_log_acesso_aplicacao (cod_usuario,cod_aplicacao,controller,action,data,ip,server,params) values(:cod_usuario,:aplicacao,:controller,:action,now(),:ip,:server,:params)";
        $funcoes->executarSQL($sql,
            array(
                'cod_usuario'   => $sessao->cod_usuario ? $sessao->cod_usuario : 0,
                'controller'    => str_replace("\\", '/', $nome_controller),
                'action'        => $action,
                'ip'            => $ip->setProxyHeader()->getIpAddress(),
                'server'        => $request->getServer()->COMPUTERNAME ? $request->getServer()->COMPUTERNAME : 'local',
                'params'        => !empty($params) ? json_encode($params) : '',
                'aplicacao'     => $aplicacao['cod_aplicacao']
            )
        );
        
        //nao verificar sessao
        if(!in_array($nome_controller, $nao_verifica_sessao)){
            if(!$funcoes->verificaSessao()){
                return $controller->redirect()->toUrl("/login");
            }else{
                if($sessao->tipo_usuario == 0){ //se for pré cadastro
                    if($action != 'bem-vindo'){ // se a action acessada nao for bem vindo
                        $permissao = $this->verificarPermissao($controller,$aplicacao['cod_aplicacao']); //ver se o novo membro possui permissao à action q está acessando
                        if(!$permissao){
                            return $controller->redirect()->toUrl("/bem-vindo");
                        }
                    }
                    if(!in_array($action, $pre_cadastro_actions_permitidas)){
                        return $controller->redirect()->toUrl("/bem-vindo");
                    }
                }else{// se nao for pré cadastro
                    if($action == 'bem-vindo' && $action == 'inicial'){//actions bloqueadas para usuarios que nao são pre-cadastro
                        return $controller->redirect()->toUrl("/");
                    }
                    if($nome_controller != 'Application\Controller\IndexController' && $action != 'responderAprendizagem' && $action != 'resultado'){// procurar pela permissao se a pagina atual não for index
                        $permissao = $this->verificarPermissao($controller,$aplicacao['cod_aplicacao']);
                        if(!$permissao){
                            return $controller->redirect()->toUrl("/");
                        }
                    }
                }
            }
        }
        
        //escolher qual view vai ser 
        $view = $e->getViewModel();  
        
        if(in_array($nome_controller, $layout_limpo)){
            $view->setTemplate('layout/layout_limpo');
        }else{
            $this->carregarMenu($controller);
            $view->setTemplate('layout/layout');
        }
    }
    
    public function layout($e){
        $controller = $e->getTarget();  
        
        $nome_controller = $controller->getEvent()->getRouteMatch()->getParam('controller');
        $pagina = $controller->getEvent()->getRouteMatch()->getParam('action');
        
        $controller->layout()->pagina = $pagina;
        
    }
    
    public function carregarMenu($controller){
        $funcoes = new Funcoes($controller);
        $sessao = new Container('usuario');
        
        $params = array(
            'cod_usuario'   => $sessao->cod_usuario,
            'tipo_user'     => $sessao->tipo_usuario,
            'situacao'      => $sessao->situacao
        );
        
        $sql = "call sys_listarMenu_sp (:cod_usuario,1,:tipo_user,:situacao)";
        $menu = $funcoes->executarSQL($sql, $params);
        
        $sql = "call sys_listarMenu_sp (:cod_usuario,2,:tipo_user,:situacao)";
        $submenu = $funcoes->executarSQL($sql, $params);
        
        $aplicacoes = array_merge($menu, $submenu);
        
        $controller->layout()->aplicacoes = $aplicacoes;
    }
    
    public function verificarPermissao($controller,$cod_aplicacao){
        $funcoes = new Funcoes($controller);
        $sessao = new Container('usuario');
        
        $params = array(
            'cod_usuario'   => $sessao->cod_usuario,
            'tipo_user'     => $sessao->tipo_usuario,
            'situacao'      => $sessao->situacao,
            'cod_aplicacao' => $cod_aplicacao
        );
        
        $sql = "call sys_verificaPermissao_sp(:cod_usuario,:tipo_user,:situacao,:cod_aplicacao)";
        $result = $funcoes->executarSQL($sql,$params,'');
        
        if($result['cod'] != 0){
            return false;
        }else{
            return true;
        }
        
    }
}
