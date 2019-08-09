<?php
/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Cadastro\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class PreCadastroController extends AbstractActionController
{
    public function preCadastroAction(){
        $view = new ViewModel();
        $view->setTemplate('cadastro/pre-cadastro');
        return $view;
    }
    
    
    public function novoAction(){
        
    }
}
