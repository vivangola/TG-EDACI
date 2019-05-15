<?php
/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Quadro\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class EventosController extends AbstractActionController
{
    public function eventosAction()
    {
        $view = new ViewModel();
        $view->setTemplate('quadro/eventos');
        return $view;
    }
}
