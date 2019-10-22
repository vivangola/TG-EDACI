<?php

/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Application\Controller;

use Application\Classes\Funcoes;
use Application\Classes\Relatorio;
use Zend\Json\Json;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Session\Container;
use Zend\View\Model\ViewModel;

class IndexController extends AbstractActionController {

    public function indexAction() {

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
            'nome_usuario' => $sessao->nome_usuario
        ));

        $view->setTemplate('application/index/index');
        return $view;
    }

    public function BemVindoAction() {
        $sessao = new Container("usuario");

        if ($sessao->tipo_usuario != 0) {
            return $this->redirect()->toUrl("/");
        }

        $view = new ViewModel(array(
            'nome_usuario' => $sessao->nome_usuario,
        ));

        $view->setTemplate('application/index/bem-vindo');
        return $view;
    }
    
    public function termoInicialAction() {
        $sessao = new Container("usuario");
        $funcoes = new Funcoes($this);
        
        $sql = "select termo from us_termo";
        $result = $funcoes->executarSQL($sql,[],'');
        
        $view = new ViewModel(array(
            'termo' => preg_replace("/\r\n|\r|\n/",'<br/>', $result['termo'])
        ));
        
        $view->setTemplate('application/termo/termo-inicial');
        return $view;
    }
    
    public function manterTermoAction(){
        $sessao = new Container("usuario");
        $funcoes = new Funcoes($this);
        
        $sql = "select termo from us_termo";
        $result = $funcoes->executarSQL($sql,[],'');

        $view = new ViewModel(array(
            'nome_usuario'  => $sessao->nome_usuario,
            'termo'         => $result['termo']
        ));

        $view->setTemplate('application/termo/manter-termo');
        return $view;
    }
    
    public function salvarTermoAction(){
        $sessao = new Container("usuario");
        $funcoes = new Funcoes($this);
        
        $response = $this->getResponse();
        
        $params = array(
            'termo' => $this->params()->fromPost('termo', '')
        );
        
        $sql = "update us_termo set termo =:termo";
        $funcoes->executarSQL($sql,$params,'');

        return $response->setContent(Json::encode(array('response' => true)));
    }
    
    public function relatorioTermoAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        $relatorio = new Relatorio();

        $params = array(
            'cod_usuario'   => $sessao->cod_usuario,
            'filtro'        => $this->params()->fromPost('filtros', '-1')
        );
        
        if($params['filtro'] == 1){
            $where = " where aceite = 1 ";
        }elseif($params['filtro'] == 2){
            $where = " where aceite = 2 ";
        }else{
            $where = " ";
        }

        $sql = 'select nome, aceite, date_format(data, "%d/%m/%Y %H:%i:%s") as data 
                from us_termo_aceite a
                        inner join us_pre_cadastro b on a.cod_usuario_fk = b.cod_usuario'
                . $where . 
                'order by data desc;';
        $result = $funcoes->executarSQL($sql, $params);
        
        $relatorio->definirColuna('NOME', 'nome', '10', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('ACEITE', '1', '10', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('DATA', 'data', '8', 'center', 't', 'n', 'n');

        $view = new ViewModel(array(
            'result'        => $result,
            'relatorio'     => $relatorio,
            'nome_usuario'  => $sessao->nome_usuario,
            'filtro'        => $params['filtro']
        ));

        $view->setTemplate('application/termo/relatorio-termo');
        return $view;
    }

    public function debugAction() {
        $funcoes = new Funcoes($this);

        echo '<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">';
        echo '<link rel="stylesheet" href="/css/font-awesome.min.css">';

        echo "<form action='/debug' method='post'>";
        echo "<button type='submit' style='width:60px;color:#00cbff;height:33px;'><i class='fa fa-bolt'></i></button>";
        if(isset($_POST['debug'])){
            echo "<textarea style='height: 300px;width: 100%;' type='text' name='debug'>".$_POST['debug']."</textarea>";
        }else{
            echo "<textarea style='height: 300px;width: 100%;' type='text' name='debug'></textarea>";
        }
        echo "</form>";

        if (isset($_POST['debug'])) {
            $sql = $_POST['debug'];
            $result = $funcoes->executarSQL($sql, []);

            $keys = array_unique($this->array_keys_multi($result));

            echo '<table class="table table-hover">'.
                    '<thead>'.
            '<tr>';
                            foreach($keys as $key){
                                echo '<th scope="col">'.strtoupper($key).'</th>';
            }
                        '</tr>'.
                    '</thead>';

            echo '<tbody>';
                    foreach($result as $dados){
                echo '<tr>';
                        foreach($keys as $key){
                            echo '<td>'.$dados[$key].'</td>';
                }
                echo '</tr>';
            }
            echo '</tbody>';
            echo '</table>';
        }
        exit;
    }

    function array_keys_multi(array $array){
        $keys = array();

        foreach ($array as $key => $value) {
            if(!is_numeric($key)){
                $keys[] = $key;
            }

            if (is_array($value)) {
                $keys = array_merge($keys, $this->array_keys_multi($value));
            }
        }

        return $keys;
    }

    public function salvarDocAction() {
        $funcoes = new Funcoes($this);
        $request = $this->getRequest();

        if ($request->isPost()) {

            $arquivo = $this->params()->fromFiles('add_arquivo', '');
            
            if($arquivo){
                if ($arquivo['error'] == 0) {
                    $ext = pathinfo($arquivo['name'], PATHINFO_EXTENSION);

                    if ($ext == 'pdf') {
                        $dir = $request->getServer()->DOCUMENT_ROOT . '/arquivos/principal/';

                        if (!file_exists($dir)) {
                            mkdir($dir, 0777);
                        }

                        $destino = $dir . 'arquivo_principal.pdf';

                        move_uploaded_file($arquivo['tmp_name'], $destino);

                        $funcoes->alertBasic('Arquivo alterado com sucesso.', false, '/', 'success', 'Sucesso!');
                        exit;
                    } else {
                        $funcoes->alertBasic('Por favor selecione um arquivo .pdf', false, '/', 'info', 'Ops...');
                        exit;
                    }
                } else {
                    $msg = $funcoes->validaArquivo($arquivo['error']);
                    $funcoes->alertBasic($msg, false, '/', 'info', 'Ops...');
                    exit;
                }
            }else{
                $funcoes->alertBasic('Por favor selecione um arquivo válido', false, '/', 'info', 'Ops...');
                exit;
            }
        } else {
            header('Location: /');
            exit;
        }
    }

    public function salvarVideoAction() {
        $funcoes = new Funcoes($this);
        $request = $this->getRequest();

        if ($request->isPost()) {

            $arquivo = $this->params()->fromFiles('add_video', '');
            
            if($arquivo){
                if ($arquivo['error'] == 0) {
                    $ext = pathinfo($arquivo['name'], PATHINFO_EXTENSION);

                    if ($ext == 'mp4') {
                        $dir = $request->getServer()->DOCUMENT_ROOT . '/arquivos/principal/';

                        if (!file_exists($dir)) {
                            mkdir($dir, 0777);
                        }

                        $destino = $dir . 'video_principal.mp4';

                        move_uploaded_file($arquivo['tmp_name'], $destino);

                        $funcoes->alertBasic('Video alterado com sucesso.', false, '/', 'success', 'Sucesso!');
                        exit;
                    } else {
                        $funcoes->alertBasic('Por favor selecione um video .mp4', false, '/', 'info', 'Ops...');
                        exit;
                    }
                } else {
                    $msg = $funcoes->validaArquivo($arquivo['error']);
                    $funcoes->alertBasic($msg, false, '/', 'info', 'Ops...');
                    exit;
                }
            }else{
                $funcoes->alertBasic('Por favor selecione um video válido', false, '/', 'info', 'Ops...');
                exit;
            }
        } else {
            header('Location: /');
            exit;
        }
    }

    

}
