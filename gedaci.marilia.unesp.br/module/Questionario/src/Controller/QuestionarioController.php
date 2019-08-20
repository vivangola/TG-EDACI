<?php
/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Questionario\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class QuestionarioController extends AbstractActionController
{
    public function questionarioAction()
    {
        echo "<pre>";
        var_dump('questionario');
        echo "</pre>";
        exit;
        $view = new ViewModel();
        
        $view->setTemplate('login/login');
        return $view;
    }
    
    public function inicialAction(){
        $view = new ViewModel();
        $view->setTemplate('questionario/questionario-inicial');
        return $view;
    }
    
    public function cadastroAction(){
        $view = new ViewModel();
        $view->setTemplate('questionario/questionario-cadastro');
        return $view;
    }
}
