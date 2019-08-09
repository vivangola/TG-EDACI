<?php
/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Login\Controller;

use Application\Classes\Funcoes;
use Zend\Json\Json;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Session\Container;
use Zend\View\Model\JsonModel;
use Zend\View\Model\ViewModel;

class LoginController extends AbstractActionController
{
    public function loginAction(){
        $view = new ViewModel();
        
        $view->setTemplate('login/login');
        return $view;
    }
    
    public function acessarAction(){
        $funcao = new Funcoes($this);
        
        $response = $this->getResponse();
        $request = $this->getRequest();
        
        if($request->isPost()){
        
            $sql = "call sys_Login_sp (:login,:senha)";
            $params = array(
                'login' => $this->params()->fromPost('login','0'),
                'senha' => $this->params()->fromPost('senha','0'),
            );

            $params['senha'] = hash('sha512', $params['senha']);

            $result = $funcao->executarSQL($sql,$params, '');

            if($result['cod'] == '0'){
                $sql = "call us_BuscarDados1_sp(:cod)";
                $result2 = $funcao->executarSQL($sql, array('cod' => $result['cod_usuario']), '');

                $sessao = new Container('usuario');

                $sessao->cod_usuario = $result['cod_usuario'];
                $sessao->nome_usuario = $result2['nome'];
                $sessao->tipo_usuario = $result2['tipo_usuario'];
                $sessao->tipo_usuario_desc = $result2['tipo_usuario_desc'];

                return $response->setContent(Json::encode(array('response' => true)));
            }else{
                return $response->setContent(Json::encode(array('response' => false, 'msg' => $result['msg'])));
            }
        }else{
            header('Location: /');
            exit;
        }
    }
    
    public function esqueciSenhaAction(){
        $view = new ViewModel();
        
        $view->setTemplate('login/esqueci-senha');
        return $view;
    }
    
    public function logoutAction(){
        $response = $this->getResponse();
        $request = $this->getRequest();
        
        $sessao = new Container('usuario');
        $sessao->getManager()->destroy();
        $sessao->getManager()->getStorage()->clear();
        
        if($request->isPost()){
            return $response->setContent(Json::encode(array('response' => true)));
        }else{
            header('Location: /');
            exit;
        }
    }
    
    public function sessaoValuesAction(){
        $response = $this->getResponse();
        
        $sessao = new Container('usuario');
        
        echo "<pre>";
        var_dump($sessao->getArrayCopy());
        echo "</pre>";
        exit;
    }
    
}
