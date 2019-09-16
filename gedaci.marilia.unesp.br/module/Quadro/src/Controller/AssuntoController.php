<?php
/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Quadro\Controller;

use Application\Classes\Funcoes;
use Application\Classes\Relatorio;
use Zend\Json\Json;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Session\Container;
use Zend\View\Model\ViewModel;

class AssuntoController extends AbstractActionController
{
    public function assuntoAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        $relatorio = new Relatorio();
        
        $params = array(
            'cod_usuario' => $sessao->cod_usuario,
            'filtro'    => $this->params()->fromPost('filtros', '-1'),
            'pesquisa'  => $this->params()->fromPost('pesquisa', ''),
        );
        
        if($params['filtro'] == '-1'){
            $params['pesquisa'] = '';
        }
        
        $sql = "call us_buscarAssunto_sp(:filtro,:pesquisa,'0')";
        $result = $funcoes->executarSQL($sql,$params);
        
        $relatorio->definirColuna('Assunto', 'assunto', '8', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('USUÁRIO', 'usuario', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('DATA', 'dt_convert', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('ALTERAR', '1', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('EXCLUIR', '2', '2', 'center', 't', 'n', 'n');
        
        $view = new ViewModel(array(
            'result'    => $result,
            'relatorio' => $relatorio,
            'filtro'    => $params['filtro'],
            'pesq'      => $params['pesquisa']
        ));
        
        $view->setTemplate('quadro/assunto');
        return $view;
    }
    
    public function addAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $response = $this->getResponse();
        $request = $this->getRequest();
        
        if($request->isPost()){
            $params = array(
                'assunto'     => $this->params()->fromPost('add_assunto', ''),
                'usuario'     => $sessao->cod_usuario
            );
            
            $sql = "insert into biblioteca_assunto(assunto,data_inclusao,cod_usuario_fk) values (:assunto,now(),:usuario)";
            $funcoes->executarSQL($sql,$params);
            
            return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Assunto adicionado.')));
        }else{
            return $response->setContent(Json::encode(array('response' => false)));
        }
    }
    
    public function deleteAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $response = $this->getResponse();
        
        $params = array(
            'assunto'       => $this->params()->fromPost('cod_assunto', ''),
            'usuario'       => $sessao->cod_usuario
        );
        
        $sql = "delete from biblioteca_assunto where cod =:assunto";
        $funcoes->executarSQL($sql,$params);
        
        return $response->setContent(Json::encode(array('response' => true)));
    }
    
    public function showEditAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $response = $this->getResponse();
        
        $params = array(
            'assunto'       => $this->params()->fromPost('cod_assunto', ''),
            'usuario'       => $sessao->cod_usuario
        );
        
        $sql = "call us_buscarAssunto_sp('0','0',:assunto)";
        $result = $funcoes->executarSQL($sql,$params, '');
        
        if(!$result){
            $retorno = false;
        }else{
            $retorno = true;
        }
        
        return $response->setContent(Json::encode(array('response' => $retorno, 'result' => $result)));
    }
    
    public function editAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $response = $this->getResponse();
        
        $params = array(
            'cod_assunto'       => $this->params()->fromPost('cod_assunto', ''),
            'assunto'           => $this->params()->fromPost('assunto', ''),
            'usuario'           => $sessao->cod_usuario
        );
        
        $sql = "update biblioteca_assunto set assunto =:assunto" .
                    " where cod =:cod_assunto";
        $funcoes->executarSQL($sql,$params);
        
        return $response->setContent(Json::encode(array('response' => true)));
    }
}
