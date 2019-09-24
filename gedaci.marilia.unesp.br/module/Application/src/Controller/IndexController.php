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
            //$arquivo['name'] = str_replace(" ", "_", preg_replace('/[`^~\'"]/', null, iconv('UTF-8', 'ASCII//TRANSLIT', $arquivo['name'])));

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
                $msg = $this->validaArquivo($arquivo['error']);
                $funcoes->alertBasic($msg, false, '/', 'info', 'Ops...');
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
            //$arquivo['name'] = str_replace(" ", "_", preg_replace('/[`^~\'"]/', null, iconv('UTF-8', 'ASCII//TRANSLIT', $arquivo['name'])));

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
                $msg = $this->validaArquivo($arquivo['error']);
                $funcoes->alertBasic($msg, false, '/', 'info', 'Ops...');
                exit;
            }
        } else {
            header('Location: /');
            exit;
        }
    }

    private function validaArquivo($code) {

        switch ($code) {
            case 1:
            case 2:
            case 3:
                $message = "Arquivo muito grande, por favor selecione outro!";
                break;
            case 4:
                $message = "Por favor selecione um arquivo!";
                break;
            case 6:
                $message = "Diretorio nao encontrado, por favor tente novamente!";
                break;
            case 7:
                $message = "Erro ao salvar arquivo no servidor, por favor selecione outro!";
                break;
            case 8:
                $message = "Extensão inválida, por favor selecione outro arquivo!";
                break;

            default:
                $message = "Erro, por favor selecione outro!";
                break;
        }
        return $message;
    }

}
