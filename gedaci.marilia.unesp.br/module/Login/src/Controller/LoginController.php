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
        
        $sql = "select * from us_acesso where login =:login and senha =:senha and situacao = 1";
        $params = array(
            'login' => $this->params()->fromPost('login','0'),
            'senha' => $this->params()->fromPost('senha','0'),
        );
        
        $result = $funcao->executarSQL($sql,$params, '');
        
        if($result){
            $sql = "call us_BuscarDados1_sp(:cod)";
            $result2 = $funcao->executarSQL($sql, array('cod' => $result['cod']), '');
            
            $sessao = new Container('usuario');
            
            $sessao->cod_usuario = $result['cod'];
            $sessao->nome_usuario = $result2['nome'];
            $sessao->tipo_usuario = $result2['tipo_usuario'];
            $sessao->tipo_usuario_desc = $result2['tipo_usuario_desc'];
            
            return $response->setContent(Json::encode(array('response' => true)));
        }else{
            return $response->setContent(Json::encode(array('response' => false, 'msg' => utf8_encode('Senha ou/e Login não estão corretos.'))));
        }
    }
    
    public function esqueciSenhaAction(){
        $view = new ViewModel();
        
        $view->setTemplate('login/esqueci-senha');
        return $view;
    }
    
    public function logoutAction(){
        $response = $this->getResponse();
        
        $sessao = new Container('usuario');
        $sessao->getManager()->destroy();
        $sessao->getManager()->getStorage()->clear();
        
        return $response->setContent(Json::encode(array('response' => true)));
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
