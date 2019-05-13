<?php
/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Application;

use Application\Classes\Funcoes;
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
        $sharedEvents->attach('Zend\Mvc\Controller\AbstractActionController', MvcEvent::EVENT_DISPATCH, array($this, 'modalLayout'), 1);
        $sharedEvents->attach('Zend\Mvc\Controller\AbstractActionController', MvcEvent::EVENT_DISPATCH, array($this, 'onDispatchError'), 2);
        
    }
    
    public function onDispatchError(MvcEvent $event){
        
        $controller = $event->getTarget(); 
        //$nome_controller = $controller->getEvent()->getRouteMatch()->getParam('controller');
        
         $response = $event->getResponse();
         
        $view = $event->getViewModel();
        switch ($response->getStatusCode()) {
            case 404:
                $view->setTemplate('layout/layout');
                $view->setVariable('titulo_da_pagina', 'Error 404');
                break;
            case 500:
                $view->setTemplate('layout/layout');
//                $result = $event->getResult();
//                $result->setVariable('error', $event->getTarget()->getRequest()->getQuery('dbug_kplay', 0) ? 1 : 0);
//                $result->setVariable('error', ini_get('display_errors'));                                                                
                $view->setVariable('titulo_da_pagina', 'Error 500');
                break;
        }
    }
    
    public function verificaAutenticacao($e){
        $controller = $e->getTarget();  
        $nome_controller = $controller->getEvent()->getRouteMatch()->getParam('controller');

        $funcoes = new Funcoes($controller);
        
        $nao_verifica_sessao = array(
            'Login\Controller\LoginController'
        );
        
        $layout_limpo = array(
            'Login\Controller\LoginController',
            'Cadastro\Controller\CadastroController',
            'Questionario\Controller\QuestionarioController'
        );
        /*
        if(!in_array($nome_controller, $nao_verifica_sessao)){
            if(!$funcoes->verificaSessao()){
                return $controller->redirect()->toUrl("/login");
            }
        }
        */
        $view = $e->getViewModel();  
        
        if(in_array($nome_controller, $layout_limpo)){
            $view->setTemplate('layout/layout_limpo');
        }else{
            $view->setTemplate('layout/layout');
        }
    }
    
    public function modalLayout($e){
        $controller = $e->getTarget();  
        $nome_controller = $controller->getEvent()->getRouteMatch()->getParam('controller');
        
        $funcoes = new Funcoes($controller);
    }
}
