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

class EscolaridadeController extends AbstractActionController
{
    public function escolaridadeAction(){
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
        
        $sql = "call us_buscarEscolaridade_sp(:filtro,:pesquisa,'0')";
        $result = $funcoes->executarSQL($sql,$params);
        
        $relatorio->definirColuna('CÓDIGO', 'cod_nivel', '1', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('NIVEL DE ESCOLARIDADE', 'escolaridade', '8', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('DATA DE CRIAÇÃO', 'data_criacao', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('ALTERAR', '1', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('EXCLUIR', '2', '2', 'center', 't', 'n', 'n');
        
        $view = new ViewModel(array(
            'result'    => $result,
            'relatorio' => $relatorio,
            'filtro'    => $params['filtro'],
            'pesq'      => $params['pesquisa']
        ));
        
        $view->setTemplate('quadro/nivel-escolaridade');
        return $view;
    }
    
    public function addAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $response = $this->getResponse();
        $request  = $this->getRequest();
        
        if($request->isPost()){
            $params = array(
                'cod_usuario'   => $sessao->cod_usuario,
                'escolaridade'  => $this->params()->fromPost('add_escolaridade', ''),
            );

            $sql = "insert into nivel_escolaridade (descricao,data_criacao) values(:escolaridade,now())";
            $funcoes->executarSQL($sql,$params);

            return $response->setContent(Json::encode(array('response' => true)));
        }else{
            header('Location: /escolaridade');
            exit;
        }
    }
    
    public function showEditAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $response = $this->getResponse();
        $request  = $this->getRequest();
        
        if($request->isPost()){
            $params = array(
                'usuario'    => $sessao->cod_usuario,
                'cod_esc'    => $this->params()->fromPost('cod_nivel', '-1'),
            );

            $sql = "call us_buscarEscolaridade_sp('','',:cod_esc)";
            $result = $funcoes->executarSQL($sql,$params,'');

            return $response->setContent(Json::encode(array('response' => true, 'escolaridade' => $result)));
        }else{
            header('Location: /escolaridade');
            exit;
        }
    }
    
    public function editAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $response = $this->getResponse();
        
        $params = array(
            'cod'           => $this->params()->fromPost('cod', ''),
            'escolaridade'  => $this->params()->fromPost('edit_desc', ''),
        );
        
        $sql = "update nivel_escolaridade set descricao =:escolaridade" .
                    " where cod_nivel =:cod";
        $funcoes->executarSQL($sql,$params);
        
        return $response->setContent(Json::encode(array('response' => true)));
    }
    
    public function deleteAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $response = $this->getResponse();
        
        $params = array(
            'cod'           => $this->params()->fromPost('cod_nivel', ''),
        );
        
        $sql = "delete from nivel_escolaridade where cod_nivel =:cod";
        $funcoes->executarSQL($sql,$params);
        
        return $response->setContent(Json::encode(array('response' => true)));
    }
}
