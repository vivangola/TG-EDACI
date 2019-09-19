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

class QuadroAvisoController extends AbstractActionController {

    public function avisosAction() {
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        $relatorio = new Relatorio();

        $params = array(
            'filtro' => $this->params()->fromPost('filtros', '-1'),
            'pesquisa' => $this->params()->fromPost('pesquisa', ''),
        );

        if ($params['filtro'] == '-1') {
            $params['pesquisa'] = '';
        }

        $sqlAvisos = "call us_buscarAvisos2_sp(:filtro,:pesquisa,'0')";
        $resultAvisos = $funcoes->executarSQL($sqlAvisos, $params);

        $sqlEsc = "select * from nivel_escolaridade order by descricao asc";
        $resultEsc = $funcoes->executarSQL($sqlEsc, $params);

        $relatorio->definirColuna('ASSUNTO', 'aviso_assunto', '10', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('DESCRIÇÃO', 'aviso_desc', '10', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('NIVEL ESCOLARIDADE', 'descricao', '8', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('DATA INÍCIO', 'inicio_exibicao', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('DATA FIM', 'fim_exibicao', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('ALTERAR', 1, '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('EXCLUIR', 2, '2', 'center', 't', 'n', 'n');

        $view = new ViewModel(array(
            'avisos' => $resultAvisos,
            'escolaridades' => $resultEsc,
            'relatorio' => $relatorio,
            'filtro' => $params['filtro'],
            'pesq' => $params['pesquisa']
        ));

        $view->setTemplate('quadro/avisos');
        return $view;
    }

    public function addAction() {
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");

        $response = $this->getResponse();

        $params = array(
            'assunto' => $this->params()->fromPost('add_assunto', ''),
            'desc' => $this->params()->fromPost('add_desc', ''),
            'escolaridade' => $this->params()->fromPost('add_escolaridade', ''),
            'dtini' => $this->params()->fromPost('add_dtini', ''),
            'dtfim' => $this->params()->fromPost('add_dtfim', ''),
            'hini' => $this->params()->fromPost('add_hini', ''),
            'hfim' => $this->params()->fromPost('add_hfim', ''),
            'usuario' => $sessao->cod_usuario
        );

        $params['dtini'] = $params['dtini'] . ' ' . $params['hini'];
        $params['dtfim'] = $params['dtfim'] . ' ' . $params['hfim'];

        if ($params['escolaridade'] == 0) {
            $sql = "insert into avs_avisos(assunto,descricao,nivel_escolaridade_fk,inicio_exibicao,fim_exibicao,cod_usuario_fk,data_cadastro)" .
                    "select :assunto,:desc,cod_nivel,:dtini,:dtfim,:usuario,now() ".
                    "from nivel_escolaridade";
        } else {
            $sql = "insert into avs_avisos(assunto,descricao,nivel_escolaridade_fk,inicio_exibicao,fim_exibicao,cod_usuario_fk,data_cadastro)" .
                    "values (:assunto,:desc,:escolaridade,:dtini,:dtfim,:usuario,now())";
        }
        $funcoes->executarSQL($sql, $params);

        return $response->setContent(Json::encode(array('response' => true)));
    }

    public function editAction() {
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");

        $response = $this->getResponse();

        $params = array(
            'cod_aviso' => $this->params()->fromPost('cod', ''),
            'assunto' => $this->params()->fromPost('edit_assunto', ''),
            'desc' => $this->params()->fromPost('edit_desc', ''),
            'escolaridade' => $this->params()->fromPost('edit_escolaridade', ''),
            'dtini' => $this->params()->fromPost('edit_dtini', ''),
            'dtfim' => $this->params()->fromPost('edit_dtfim', ''),
            'hini' => $this->params()->fromPost('edit_hini', ''),
            'hfim' => $this->params()->fromPost('edit_hfim', ''),
            'usuario' => $sessao->cod_usuario
        );

        $params['dtini'] = $params['dtini'] . ' ' . $params['hini'];
        $params['dtfim'] = $params['dtfim'] . ' ' . $params['hfim'];
        
        if ($params['escolaridade'] == 0) {
            $sqlAtual = "select nivel_escolaridade_fk from avs_avisos where cod_aviso = :cod_aviso";
            $params['atual'] = $funcoes->executarSQL($sqlAtual, $params,'fetch')['nivel_escolaridade_fk'];
            
            $sql = "insert into avs_avisos(assunto,descricao,nivel_escolaridade_fk,inicio_exibicao,fim_exibicao,cod_usuario_fk,data_cadastro)" .
                    "select :assunto,:desc,cod_nivel,:dtini,:dtfim,:usuario,now() ".
                    "from nivel_escolaridade where cod_nivel <> :atual";            
        }else{
            $sql = "update avs_avisos set assunto =:assunto,descricao =:desc,nivel_escolaridade_fk =:escolaridade,inicio_exibicao =:dtini,fim_exibicao =:dtfim" .
                    " where cod_aviso =:cod_aviso";
        }
        $funcoes->executarSQL($sql, $params);

        return $response->setContent(array('response' => true));
    }

    public function showEditAction() {
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");

        $response = $this->getResponse();

        $params = array(
            'aviso' => $this->params()->fromPost('cod_aviso', ''),
            'usuario' => $sessao->cod_usuario
        );

        $sql = "call us_buscarAvisos2_sp('0','0',:aviso);";
        $result = $funcoes->executarSQL($sql, $params, '');

        if (!$result) {
            $retorno = false;
        } else {
            $retorno = true;
            //$result = $funcoes->utf8_converter($result, '');
        }

        return $response->setContent(Json::encode(array('response' => $retorno, 'result' => $result)));
    }

    public function deleteAction() {
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");

        $response = $this->getResponse();

        $params = array(
            'aviso' => $this->params()->fromPost('cod_aviso', ''),
            'usuario' => $sessao->cod_usuario
        );

        $sql = "delete from avs_avisos where cod_aviso =:aviso";
        $funcoes->executarSQL($sql, $params);

        return $response->setContent(Json::encode(array('response' => true)));
    }

}
