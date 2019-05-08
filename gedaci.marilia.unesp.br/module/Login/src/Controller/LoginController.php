<?php
/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Login\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class LoginController extends AbstractActionController
{
    public function loginAction()
    {
        $view = new ViewModel();
        
        $view->setTemplate('login/login');
        return $view;
    }
    
    public function esqueciSenhaAction()
    {
        $view = new ViewModel();
        
        $view->setTemplate('login/esqueci-senha');
        return $view;
    }
}
