<?php
/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Cadastro\Controller;

use Application\Classes\Funcoes;
use Zend\Json\Json;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Session\Container;
use Zend\View\Model\ViewModel;

class CadastroController extends AbstractActionController
{
    public function cadastroAction(){
        $funcoes = new Funcoes($this);
        
        $sql = "select cod_nivel,descricao from nivel_escolaridade order by descricao";
        $escolaridades = $funcoes->executarSQL($sql,[]);
        
        $view = new ViewModel(array(
            'escolaridades' => $escolaridades
        ));
        
        $view->setTemplate('cadastro/cadastro');
        return $view;
    }
    
    
    public function novoAction(){
        $funcoes = new Funcoes($this);
        
        $response = $this->getResponse();
        $request  = $this->getRequest();
        
        if($request->isPost()){
            $params = array(
                'nome'          => $this->params()->fromPost('nome', ''),
                'email'         => $this->params()->fromPost('email', ''),
                'escolaridade'  => $this->params()->fromPost('escolaridade', ''),
                'senha'         => $this->params()->fromPost('senha', '')
            );

            $params['senha'] = md5($params['senha']);
            
            $sql = "call sys_novoPreCadastro_sp(:nome,:email,:escolaridade,:senha)";
            $result = $funcoes->executarSQL($sql,$params, '');

            if(!$result){
                return $response->setContent(Json::encode(array('response' => false, 'msg' => 'Erro ao realizar o seu pré-cadastro.<br>Por favor tente novamente em alguns segundos.')));
            }else{
                if($result['cod'] == '0'){
                    $retorno = true;
                }else{
                    $retorno = false;
                }
                return $response->setContent(Json::encode(array('response' => $retorno, 'msg' => $result['msg'])));
            }
        }else{
            header('Location: /');
            exit;
        }
    }
}
