<?php
/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class PerfilController extends AbstractActionController
{
    public function perfilAction()
    {
        $view = new ViewModel();
        
        $view->setTemplate('application/perfil/perfil');
        return $view;
    }
}
