<?php
/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Application\Controller;

use Application\Classes\Funcoes;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\Session\Container;

class IndexController extends AbstractActionController
{
    public function indexAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $params = array(
            'cod_usuario' => $sessao->cod_usuario,
        );
        
        $sql = "call us_buscarAvisos_sp (:cod_usuario)";
        $avisos = $funcoes->executarSQL($sql,$params);
        
        $view = new ViewModel(array(
            'avisos' => $avisos,
        ));
        
        $view->setTemplate('application/index/index');
        return $view;
    }
	
}
