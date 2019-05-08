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
        $view = new ViewModel();
        echo "<pre>";
        var_dump('sdsadad');
        echo "</pre>";
        exit;
        $view->setTemplate('login/login');
        return $view;
    }
}
