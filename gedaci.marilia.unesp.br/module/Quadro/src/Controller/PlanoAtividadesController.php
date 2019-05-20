<?php
/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Quadro\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class PlanoAtividadesController extends AbstractActionController
{
    public function PlanoAtividadesAction()
    {
        $view = new ViewModel();
        $view->setTemplate('quadro/atividades');
        return $view;
    }
}
