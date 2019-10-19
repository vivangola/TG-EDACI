<?php

/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Quadro\Controller;

use Application\Classes\Funcoes;
use Application\Classes\Relatorio;
use Zend\Json\Json;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Session\Container;
use Zend\View\Model\ViewModel;

class BibliotecaController extends AbstractActionController {

    public function bibliotecaAction() {
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        $relatorio = new Relatorio();

        $params = array(
            'cod_usuario' => $sessao->cod_usuario,
            'filtro' => $this->params()->fromPost('filtros', '-1'),
            'pesquisa' => $this->params()->fromPost('pesquisa', ''),
        );

        if ($params['filtro'] == '-1') {
            $params['pesquisa'] = '';
        }

        $sql = "call us_buscarBiblioteca_sp(:filtro,:pesquisa,'0')";
        $result = $funcoes->executarSQL($sql, $params);

        $sql = "select * from biblioteca_assunto";
        $assuntos = $funcoes->executarSQL($sql, $params);

        $relatorio->definirColuna('CONTEUDO SINTÉTICO', 'conteudo', '8', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('ASSUNTO', 'assunto', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('USUÁRIO', 'usuario', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('DATA UPLOAD', 'data_upload', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('DOWNLOAD', '1', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('ALTERAR', '2', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('EXCLUIR', '3', '2', 'center', 't', 'n', 'n');

        $view = new ViewModel(array(
            'result' => $result,
            'relatorio' => $relatorio,
            'assuntos' => $assuntos,
            'filtro' => $params['filtro'],
            'pesq' => $params['pesquisa']
        ));

        $view->setTemplate('quadro/biblioteca');
        return $view;
    }

    public function addAction() {
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");

        $response = $this->getResponse();
        $request = $this->getRequest();

        if ($request->isPost()) {
            $params = array(
                'conteudo' => $this->params()->fromPost('add_conteudo', ''),
                'assunto' => $this->params()->fromPost('add_assunto', ''),
                'usuario' => $sessao->cod_usuario
            );

            $arquivo = $this->params()->fromFiles('add_arquivo', '');

            if ($arquivo) {
                if ($arquivo['error'] == 0) {
                    $ext = pathinfo($arquivo['name'], PATHINFO_EXTENSION);

                    $dir = $_SERVER['DOCUMENT_ROOT'] . '/arquivos/biblioteca/';

                    if (!file_exists($dir)) {
                        mkdir($dir, 0777);
                    }

                    $params['arquivo_nome'] = 'material-' . date("Y-m-d-H-m-s") . '.' . $ext;

                    $destino = $dir . $params['arquivo_nome'];

                    move_uploaded_file($arquivo['tmp_name'], $destino);

                    if (file_exists($destino)) {

                        $sql = "insert into biblioteca(cod_usuario_fk,conteudo,assunto_fk,arquivo,data_upload) values (:usuario,:conteudo,:assunto,:arquivo_nome,now());";
                        $funcoes->executarSQL($sql, $params);

                        return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Material salvo com sucesso!')));
                    } else {
                        return $response->setContent(Json::encode(array('response' => false, 'msg' => 'Erro ao alterar material!')));
                    }
                } else {
                    $msg = $funcoes->validaArquivo($arquivo['error']);
                    return $response->setContent(Json::encode(array('response' => false, 'msg' => $msg)));
                }
            } else {
                return $response->setContent(Json::encode(array('response' => false, 'msg' => 'Por favor selecione um arquivo válido!')));
            }
        } else {
            header('Location: /biblioteca');
            exit;
        }
    }

    public function deleteAction() {
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");

        $response = $this->getResponse();

        $params = array(
            'cod' => $this->params()->fromPost('cod', ''),
            'usuario' => $sessao->cod_usuario
        );

        $sql = "select * from biblioteca where cod =:cod";
        $result = $funcoes->executarSQL($sql, $params, '');

        $sql = "delete from biblioteca where cod =:cod";
        $funcoes->executarSQL($sql, $params);

        unlink($_SERVER['DOCUMENT_ROOT'] . '/arquivos/biblioteca/' . $result['arquivo']);

        return $response->setContent(Json::encode(array('response' => true)));
    }

    public function showEditAction() {
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");

        $response = $this->getResponse();

        $params = array(
            'cod' => $this->params()->fromPost('cod', ''),
            'usuario' => $sessao->cod_usuario
        );

        $sql = "call us_buscarBiblioteca_sp(0,'',:cod)";
        $result = $funcoes->executarSQL($sql, $params, '');

        if (!$result) {
            $retorno = false;
        } else {
            $retorno = true;
        }

        return $response->setContent(Json::encode(array('response' => $retorno, 'result' => $result)));
    }

    public function editAction() {
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");

        $response = $this->getResponse();

        $params = array(
            'cod' => $this->params()->fromPost('edit_cod', ''),
            'conteudo' => $this->params()->fromPost('edit_conteudo', ''),
            'assunto' => $this->params()->fromPost('edit_assunto', ''),
            'usuario' => $sessao->cod_usuario
        );

        $arquivo = $this->params()->fromFiles('edit_arquivo', '');

        if ($arquivo) {
            if ($arquivo['error'] == 0) {

                $ext = pathinfo($arquivo['name'], PATHINFO_EXTENSION);

                $dir = $_SERVER['DOCUMENT_ROOT'] . '/arquivos/biblioteca/';

                if (!file_exists($dir)) {
                    mkdir($dir, 0777);
                }

                $params['arquivo_nome'] = 'material-' . date("Y-m-d-H-m-s") . '.' . $ext;

                $destino = $dir . $params['arquivo_nome'];

                move_uploaded_file($arquivo['tmp_name'], $destino);

                if (file_exists($destino)) {
                    $sql = "update biblioteca set conteudo =:conteudo,assunto_fk =:assunto,arquivo=:arquivo_nome where cod =:cod";
                    $funcoes->executarSQL($sql, $params);

                    return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Material alterado com sucesso!')));
                } else {
                    return $response->setContent(Json::encode(array('response' => false, 'msg' => 'Erro ao alterar material!')));
                }
            } else {
                $msg = $funcoes->validaArquivo($arquivo['error']);
                return $response->setContent(Json::encode(array('response' => false, 'msg' => $msg)));
            }
        } else {
            $sql = "update biblioteca set conteudo =:conteudo, assunto_fk =:assunto where cod =:cod";
            $funcoes->executarSQL($sql, $params);

            return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Material alterado com sucesso!')));
        }
    }

}
