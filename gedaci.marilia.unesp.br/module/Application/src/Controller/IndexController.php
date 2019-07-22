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

class IndexController extends AbstractActionController
{
    public function indexAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        $relatorio = new Relatorio();
        
        $params = array(
            'cod_usuario' => $sessao->cod_usuario,
        );
        
        $sql = "call us_buscarAvisos_sp (:cod_usuario)";
        $avisos = $funcoes->executarSQL($sql,$params);
        
        $relatorio->definirColuna('ASSUNTO', 'assunto', '10', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('DESCRIÇÃO', 'descricao', '10', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('DATA RECEBIDO', 'dt_convert', '8', 'center', 't', 'n', 'n');
        
        $view = new ViewModel(array(
            'avisos' => $avisos,
            'relatorio' => $relatorio
        ));
        
        $view->setTemplate('application/index/index');
        return $view;
    }
	
}
