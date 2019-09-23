<?php
/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Application\Controller;

use Application\Classes\Funcoes;
use Application\Classes\Relatorio;
use Zend\Json\Json;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Session\Container;
use Zend\View\Model\ViewModel;

class UsuariosController extends AbstractActionController
{
    
    public function membrosAction(){
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
        
        $sql = "call us_BuscarMembros_sp (:cod_usuario)";
        $membros = $funcoes->executarSQL($sql,$params);
        
        $relatorio->definirColuna('FOTO', '0', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('NOME', 'nome', '10', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('TIPO', 'tipo_usuario_desc', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('ESCOLARIDADE', 'escolaridade_descricao', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('DATA ENTRADA', 'data_criacao', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('INATIVO / ATIVO', '1', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('ACEITAR / RECUSAR PRÉ-CADASTRO', '2', '4', 'center', 't', 'n', 'n');
        
        $view = new ViewModel(array(
            'membros' => $membros,
            'relatorio' => $relatorio,
            'filtro'    => $params['filtro'],
            'pesq'      => $params['pesquisa']
        ));
        
        $view->setTemplate('application/usuarios/membros');
        return $view;
    }
    
    public function ativarAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $response = $this->getResponse();
        
        $params = array(
            'cod_usuario'   => $sessao->cod_usuario,
            'user'          => $this->params()->fromPost('cod_usuario', '0'),
            'ativar'        => $this->params()->fromPost('ativar', '0')
        );
        
        $sql = "update us_acesso set situacao =:ativar where cod_usuario_fk =:user";
        $funcoes->executarSQL($sql,$params);
        
        return $response->setContent(Json::encode(array('response' => true)));
    }
    
    public function aceitarAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $response = $this->getResponse();
        
        $params = array(
            'adm'           => $sessao->cod_usuario,
            'usuario'       => $this->params()->fromPost('cod_usuario', '-1'),
            'aceitar'       => $this->params()->fromPost('aceitar', '0'),
        );
        
        $sql = "call us_aceitarPreCadastro_sp (:adm,:usuario,:aceitar)";
        $result = $funcoes->executarSQL($sql,$params,'');
        
        
        return $response->setContent(Json::encode(array('response' => true, 'msg' => $result['msg'])));
    }
    
    public function gruposAction(){
        
    }
    
    public function logAction(){
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
        
        $sql = "call us_log_sp (:filtro,:pesquisa)";
        $log = $funcoes->executarSQL($sql,$params);
        
        $relatorio->definirColuna('USUÁRIO', 'user', '4', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('APLICACÃO', 'aplicacao', '4', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('DATA ENTRADA', 'data_movimento', '4', 'center', 't', 'n', 'n');
        
        $relatorio->definirLink('aplicacao', '[link]');
        
        $view = new ViewModel(array(
            'membros'   => $log,
            'relatorio' => $relatorio,
            'filtro'    => $params['filtro'],
            'pesq'      => $params['pesquisa']
        ));
        
        $view->setTemplate('application/usuarios/log');
        return $view;
    }
	
}
