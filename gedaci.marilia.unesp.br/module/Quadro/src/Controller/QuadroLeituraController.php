<?php
/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Quadro\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class QuadroLeituraController extends AbstractActionController
{
    public function quadroLeituraAction()
    {
        $view = new ViewModel();
        echo "<pre>";
        var_dump('quadro de leitura');
        echo "</pre>";
        exit;
        $view->setTemplate('login/login');
        return $view;
    }
}
