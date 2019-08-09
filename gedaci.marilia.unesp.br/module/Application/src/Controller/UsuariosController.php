<?php
/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Application\Controller;

use Application\Classes\Funcoes;
use Application\Classes\Relatorio;
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
        
        $relatorio->definirColuna('FOTO', '0', '8', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('NOME', 'nome', '10', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('TIPO', 'tipo_usuario_desc', '10', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('ESCOLARIDADE', 'escolaridade_descricao', '10', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('DATA ENTRADA', 'data_criacao', '8', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('ATIVAR / INATIVAR', '1', '8', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('ACEITAR / RECUSAR PRÉ-CADASTRO', '2', '8', 'center', 't', 'n', 'n');
        
        $view = new ViewModel(array(
            'membros' => $membros,
            'relatorio' => $relatorio,
            'filtro'    => $params['filtro'],
            'pesq'      => $params['pesquisa']
        ));
        
        $view->setTemplate('application/usuarios/membros');
        return $view;
    }
    
    public function gruposAction(){
        
    }
	
}
