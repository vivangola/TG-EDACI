<?php

/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Quadro\Controller;

use Application\Classes\Funcoes;
use Application\Classes\Relatorio;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Json\Json;
use Zend\Session\Container;
use Zend\View\Model\ViewModel;

class TrabalhoCorrecaoController extends AbstractActionController {

    public function trabalhoCorrecaoAction() {
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
        
        $sql = "select cod_usuario, nome from us_usuario where tipo_usuario_fk = 2 and ativo = 1";
        $membros = $funcoes->executarSQL($sql, $params);
            
        $sql = "call us_buscarProducaoGrupo_sp(:filtro,:pesquisa,'0')";
        $result = $funcoes->executarSQL($sql, $params);

        $relatorio->definirColuna('MEMBRO', 'origem', '4', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('OBSERVAÇÃO', 'titulo', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('DATA ENVIO', 'autor', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('MODALIDADE', 'modalidade', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('STATUS', 'formato', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('DATA CORREÇÃO', 'autor', '4', 'center', 't', 'n', 'n');
        
        $relatorio->definirColuna('DOWNLOAD', '1', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('ALTERAR', '2', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('EXCLUIR', '3', '2', 'center', 't', 'n', 'n');

        $view = new ViewModel(array(
            'result' => $result,
            'membros' => $membros,
            'relatorio' => $relatorio,
            'filtro' => $params['filtro'],
            'pesq' => $params['pesquisa']
        ));
        $view->setTemplate('quadro/trabalho-correcao');
        return $view;
    }

    public function addAction() {

        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");

        $response = $this->getResponse();
        $request = $this->getRequest();

        if ($request->isPost()) {

            $post_data = $this->params()->fromPost();
            $post_data['usuario'] = $sessao->cod_usuario;

            $arquivo = $this->params()->fromFiles('add_arquivo', '');

            if ($arquivo) {
                if ($arquivo['error'] == 0) {
                    $ext = pathinfo($arquivo['name'], PATHINFO_EXTENSION);

                    $dir = $_SERVER['DOCUMENT_ROOT'] . '/arquivos/trabalho-correcao/';

                    if (!file_exists($dir)) {
                        mkdir($dir, 0777);
                    }

                    $post_data['arquivo_nome'] = 'correcao-' . date("Y-m-d-H-m-s") . '.' . $ext;

                    $destino = $dir . $post_data['arquivo_nome'];

                    move_uploaded_file($arquivo['tmp_name'], $destino);

                    if (file_exists($destino)) {

                        $sql = "insert into trbl_correcao_trabalho (remetente_fk, destinatario_fk, observacao, data_enviado, modalidade, status, arquivo) " .
                                "values (:usuario, :add_membro, :add_observacao, now(), :add_modalidade, 1, :arquivo_nome);";
                        $funcoes->executarSQL($sql, $post_data);

                        return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Trabalho Enviado para Correção!')));
                    } else {
                        return $response->setContent(Json::encode(array('response' => false, 'msg' => 'Erro ao enviar!')));
                    }
                } else {
                    $msg = $funcoes->validaArquivo($arquivo['error']);
                    return $response->setContent(Json::encode(array('response' => false, 'msg' => $msg)));
                }
            } else {
                return $response->setContent(Json::encode(array('response' => false, 'msg' => 'Por favor selecione um arquivo válido!')));
            }
        } else {
            return $response->setContent(Json::encode(array('response' => false)));
        }
    }

    public function deleteAction() {
        $funcoes = new Funcoes($this);
        $response = $this->getResponse();

        $params = array(
            'cod' => $this->params()->fromPost('cod', ''),
        );

        $sql = "delete from producao_grupo where cod_producao=:cod";
        $funcoes->executarSQL($sql, $params);

        return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Produção de Grupo excluída.')));
    }

    public function showEditAction() {
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");

        $response = $this->getResponse();
        $request = $this->getRequest();

        if ($request->isPost()) {
            $params = array(
                'usuario' => $sessao->cod_usuario,
                'cod' => $this->params()->fromPost('cod', '-1'),
            );

            $sql = "call us_buscarProducaoGrupo_sp(0,'',:cod)";
            $result = $funcoes->executarSQL($sql, $params, '');

            return $response->setContent(Json::encode(array('response' => true, 'result' => $result)));
        } else {
            header('Location: /producao-grupo');
            exit;
        }
    }

    public function editAction() {
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");

        $response = $this->getResponse();
        $request = $this->getRequest();

        if ($request->isPost()) {
            $post_data = $this->params()->fromPost();
            $post_data['usuario'] = $sessao->cod_usuario;

            $arquivo = $this->params()->fromFiles('edit_arquivo', '');

            if ($arquivo) {
                if ($arquivo['error'] == 0) {
                    $ext = pathinfo($arquivo['name'], PATHINFO_EXTENSION);

                    $dir = $_SERVER['DOCUMENT_ROOT'] . '/arquivos/producao-grupo/';

                    if (!file_exists($dir)) {
                        mkdir($dir, 0777);
                    }

                    $post_data['arquivo_nome'] = 'producao-' . date("Y-m-d-H-m-s") . '.' . $ext;

                    $destino = $dir . $post_data['arquivo_nome'];

                    move_uploaded_file($arquivo['tmp_name'], $destino);

                    if (file_exists($destino)) {

                        $sql = "update producao_grupo set cod_usuario_fk=:usuario, origem= :edit_origem, titulo=:edit_titulo, autor=:edit_autor, modalidade=:edit_modalidade, nome=:edit_nome, qualis=:edit_qualis, link=:edit_link, esclarecimentos=:edit_esclarecimento, status=:edit_status, data_publicacao=:edit_publicacao, data_submissao=now(), formato=:edit_formato, arquivo=:arquivo_nome where cod_producao=:edit_cod;";
                        $funcoes->executarSQL($sql, $post_data);

                        return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Produção de Grupo Alterada.')));
                    } else {
                        return $response->setContent(Json::encode(array('response' => false, 'msg' => 'Erro ao alterar Produção de Grupo.')));
                    }
                } else {
                    $msg = $funcoes->validaArquivo($arquivo['error']);
                    return $response->setContent(Json::encode(array('response' => false, 'msg' => $msg)));
                }
            } else {
                $sql = "update producao_grupo set cod_usuario_fk=:usuario, origem= :edit_origem, titulo=:edit_titulo, autor=:edit_autor, modalidade=:edit_modalidade, nome=:edit_nome, qualis=:edit_qualis, link=:edit_link, esclarecimentos=:edit_esclarecimento, status=:edit_status, data_publicacao=:edit_publicacao, data_submissao=now(), formato=:edit_formato where cod_producao=:edit_cod;";
                $funcoes->executarSQL($sql, $post_data);

                return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Produção de Grupo Alterado.')));
            }
        } else {
            return $response->setContent(Json::encode(array('response' => false)));
        }
    }

}
