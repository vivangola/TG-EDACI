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
        $avisos = $funcoes->executarSQL($sql, $params);

        $relatorio->definirColuna('ASSUNTO', 'assunto', '10', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('DESCRIÇÃO', 'descricao', '10', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('DATA RECEBIDO', 'dt_convert', '8', 'center', 't', 'n', 'n');

        $view = new ViewModel(array(
            'avisos' => $avisos,
            'relatorio' => $relatorio,
            'nome_usuario'  => $sessao->nome_usuario
        ));

        $view->setTemplate('application/index/index');
        return $view;
    }
    
    public function BemVindoAction(){
        $sessao = new Container("usuario");
        
        if($sessao->tipo_usuario != 0){
            return $this->redirect()->toUrl("/");
        }
        
        $view = new ViewModel(array(
            'nome_usuario' => $sessao->nome_usuario,
        ));

        $view->setTemplate('application/index/bem-vindo');
        return $view;
    }
    
    public function debugAction(){
        $funcoes = new Funcoes($this);
        
        echo "<form action='/debug' method='post'>";
        
        if(isset($_POST['debug'])){
            echo "<textarea style='height: 200px;width: 800;' type='text' name='debug'>".$_POST['debug']."</textarea>";
        }else{
            echo "<textarea style='height: 200px;width: 800;' type='text' name='debug'></textarea>";
        }
        echo '<br>';
        echo "<button type='submit'>enviar</button>";
        echo "</form>";
        
        if(isset($_POST['debug'])){
            $sql = $_POST['debug'];
            $result = $funcoes->executarSQL($sql, []);
            
            echo "<pre>";
            var_dump($result);
            echo "</pre>";
        }
        exit;
    }
	
}
