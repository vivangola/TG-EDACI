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
use Application\Classes\PHPMailer;

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

        $sql = "select cod_nivel,descricao from nivel_escolaridade order by descricao";
        $escolaridades = $funcoes->executarSQL($sql, []);

        $sql = "call us_buscarMeusTrabalhos_sp(:filtro,:pesquisa,'0',:cod_usuario)";
        $result = $funcoes->executarSQL($sql, $params);

        $relatorio->definirColuna('MEMBRO', 'nome', '4', 'left', 't', 'n', 'n');
       // $relatorio->definirColuna('ESCOLARIDADE', 'descricao', '4', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('DATA ENVIO', 'data', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('MODALIDADE', 'modalidade', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('STATUS', 'status_desc', '2', 'center', 't', 'n', 'n', '[cor]');
        
        $relatorio->definirColuna('Correções', '1', '2', 'center', 't', 'n', 'n');
        //$relatorio->definirColuna('ALTERAR', '2', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('EXCLUIR', '3', '2', 'center', 't', 'n', 'n');
        
        $relatorio->definirQuebra('','descricao','','descricao');
        
        $view = new ViewModel(array(
            'result' => $result,
            'escolaridade' => $escolaridades,
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

                        if($post_data['add_escolaridade'] == '0'){
                            $sql = "select cod_usuario, email, nome from us_usuario where nivel_escolaridade_fk > 0 and ativo = 1 and cod_usuario <> :usuario and cod_usuario = 18";
                        }else{
                            $sql = "select cod_usuario, email, nome from us_usuario where nivel_escolaridade_fk = :add_escolaridade and ativo = 1 and cod_usuario <> :usuario and cod_usuario = 18";
                        }
                        $membros = $funcoes->executarSQL($sql, $post_data);

                        foreach ($membros as $dados) {

                            $post_data['add_membro'] = $dados['cod_usuario'];
                            $sql = "insert into trbl_correcao_trabalho (remetente_fk, destinatario_fk, data, modalidade, status) " .
                                    "values (:usuario, :add_membro, now(), :add_modalidade, 0);";
                            $funcoes->executarSQL($sql, $post_data);

                            $sqlCod = "select cod_correcao from trbl_correcao_trabalho order by cod_correcao desc limit 1";
                            $post_data['cod'] = $funcoes->executarSQL($sqlCod, [], '')['cod_correcao'];

                            $sql = "insert into trbl_correcao_historico (cod_correcao_fk, usuario_fk, observacao, data_envio, arquivo) " .
                                    "values (:cod, :usuario, :add_observacao, now(), :arquivo_nome);";
                            $funcoes->executarSQL($sql, $post_data);
                            
                            $post_data['email'] = $dados['email'];
                            $post_data['nome'] = $dados['nome'];

                            $this->enviarEmail($post_data);
                            
                        }
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
    
    private function enviarEmail($params) { 
        $tabela = 
                '<body>'.
                    '<table align="center" border="0" cellpadding="0">'.
                        '<tbody>'.
                            '<tr>'.
                                '<td width="650">'.
                                    '<table style="background-color:#273043;border:1px solid #e1caa8;width:100%;padding:25px 15px;">'.
                                        '<tbody>'.
                                            '<tr>'.
                                                '<td align="center" style="font-family:arial;font-size:16px;color:#fff;">'.
                                                    'NOVO TRABALHO PARA CORRIGIR'.
                                                '</td>'.
                                            '</tr>'.
                                        '</tbody>'.
                                    '</table>'.
                                '</td>'.
                            '</tr> '.
                            '<tr>'.
                                '<td valign="top" style="padding:15px;border:1px solid #273043">'.
                                    '<table align="center" border="0" cellpadding="0" cellspacing="0">'.
                                        '<tbody>'.
                                            '<tr>'.
                                                '<td width="350" align="center" style="font:15px Arial">Descri&ccedil;&atilde;o: '.
                                                        $params['add_observacao'].
                                                '</td>'.
                                            '</tr>'.
                                        '</tbody>'.
                                    '</table>'.
                                '</td>'.
                            '</tr>'.
                            '<tr>'.
                                '<td height="90" style="font:12px Arial;background:#273043;color:white;padding:10px 15px">'.
                                    '<table style="background-color:#273043;width:100%;padding:10px 15px;">'.
                                        '<tbody>'.
                                            '<tr>'.
                                                '<td align="left" style="font-family:arial;font-size:16px;color:#fff;">'.
                                                    '<p style="font:12px arial;color:white">'.
                                                        '<span style="font:20px arial;">'.
                                                            'Atenciosamente,'.
                                                        '</span> '.
                                                        '<br> '.
                                                        'gedaci.marilia@unesp.br'.
                                                    '</p>'.
                                                '</td>'.
                                                '<td width="130">'.
                                                    '<img alt="Grupo Edaci" src="http://gedaci.marilia.unesp.br/img/logo/logo_branco.png" height="50" width="125">'.
                                                '</td>'.
                                            '</tr>'.
                                        '</tbody>'.
                                    '</table>'.
                                '</td>'.
                            '</tr>'.
                        '</tbody>'.
                    '</table>'.
                '</body>';

        $mail = new PHPMailer(true);
        try {
            $mail->isSMTP();
            $mail->Host = '200.145.171.12';
            $mail->SMTPAuth = false;
            $mail->SMTPSecure = 'tls';
            $mail->Port = 25;
            $mail->SMTPOptions = array(
                'ssl' => array(
                    'verify_peer' => false,
                    'verify_peer_name' => false,
                    'allow_self_signed' => true
                )
            );
            $mail->setFrom('gedaci.marilia@unesp.br', 'GEDACI');
            $mail->addAddress($params['email'], $params['nome']);
            $mail->isHTML(true);
            $mail->Subject = 'TRABALHO PARA CORRIGIR - GRUPO EDACI';
            $mail->Body = $tabela;
            $mail->send();
            return true;
        } catch (Exception $e) {
            return false;
        }
    }

    public function deleteAction() {
        $funcoes = new Funcoes($this);
        $response = $this->getResponse();

        $params = array(
            'cod' => $this->params()->fromPost('cod', ''),
        );

        $sql = "delete from trbl_correcao_trabalho where cod_correcao=:cod";
        $funcoes->executarSQL($sql, $params);

        $sql = "delete from trbl_correcao_historico where cod_correcao_fk=:cod";
        $funcoes->executarSQL($sql, $params);

        return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Trabalho de Correção Excluída!')));
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

            $sql = "call us_buscarMeusTrabalhos_sp(0,'',:cod, :usuario)";
            $result = $funcoes->executarSQL($sql, $params, '');

            return $response->setContent(Json::encode(array('response' => true, 'result' => $result)));
        } else {
            header('Location: /trabalho-correcao');
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

                    $dir = $_SERVER['DOCUMENT_ROOT'] . '/arquivos/trabalho-correcao/';

                    if (!file_exists($dir)) {
                        mkdir($dir, 0777);
                    }

                    $post_data['arquivo_nome'] = 'correcao-' . date("Y-m-d-H-m-s") . '.' . $ext;

                    $destino = $dir . $post_data['arquivo_nome'];

                    move_uploaded_file($arquivo['tmp_name'], $destino);

                    if (file_exists($destino)) {

                        $sql = "update trbl_correcao_trabalho set destinatario_fk = :edit_membro, modalidade = :edit_modalidade where cod_correcao=:edit_cod;";
                        $funcoes->executarSQL($sql, $post_data);

                        $sql = "update trbl_correcao_historico set observacao = :edit_observacao, data_envio = now(), arquivo = :arquivo_nome where cod_correcao_fk=:edit_cod;";
                        $funcoes->executarSQL($sql, $post_data);

                        return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Trabalho de Correção Alterado!')));
                    } else {
                        return $response->setContent(Json::encode(array('response' => false, 'msg' => 'Erro ao alterar Trabalho de Correção!')));
                    }
                } else {
                    $msg = $funcoes->validaArquivo($arquivo['error']);
                    return $response->setContent(Json::encode(array('response' => false, 'msg' => $msg)));
                }
            } else {
                $sql = "update trbl_correcao_trabalho set destinatario_fk = :edit_membro, modalidade = :edit_modalidade where cod_correcao=:edit_cod;";
                $funcoes->executarSQL($sql, $post_data);

                $sql = "update trbl_correcao_historico set observacao = :edit_observacao, data_envio = now() where cod_correcao_fk=:edit_cod;";
                $funcoes->executarSQL($sql, $post_data);

                return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Produção de Grupo Alterado.')));
            }
        } else {
            return $response->setContent(Json::encode(array('response' => false)));
        }
    }
    
    public function historicoAction() {
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        $relatorio = new Relatorio();

        $cod_correcao = $this->params()->fromQuery('c');
        $recebidos = $this->params()->fromQuery('r');
        
        $sql = "select b.nome, date_format(c.data_envio, '%d/%m/%Y') as data, c.observacao, 
                c.arquivo, a.remetente_fk, a.destinatario_fk, a.status
		from trbl_correcao_trabalho a	
                    inner join trbl_correcao_historico c on c.cod_correcao_fk = a.cod_correcao
                    inner join us_usuario b on c.usuario_fk = b.cod_usuario	
		where a.cod_correcao = :cod_correcao";
        $result = $funcoes->executarSQL($sql, ['cod_correcao' => $cod_correcao]);
        
        $relatorio->definirColuna('INTERAÇÃO', '1', '4', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('MEMBRO', 'nome', '4', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('DATA ENVIO', 'data', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('OBSERVAÇÃO', 'observacao', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('DOWNLOAD', '2', '2', 'center', 't', 'n', 'n');
        
        if($result[0]['remetente_fk'] == $sessao->cod_usuario && $result[0]['status']){
            $exibeBtn = 1;
        }else if($result[0]['destinatario_fk'] == $sessao->cod_usuario && !$result[0]['status']){
            $exibeBtn = 1;
        }else{
            $exibeBtn = 0;
        }
        
        $view = new ViewModel(array(
            'result' => $result,
            'exibeBtn' => $exibeBtn,
            'cod_correcao' => $cod_correcao,
            'recebidos' => $recebidos,
            'relatorio' => $relatorio,
        ));
        $view->setTemplate('quadro/historico-correcao');

        return $view;
    }
    
    public function addHistoricoAction() {

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

                        $sql = "select remetente_fk from trbl_correcao_trabalho where cod_correcao = :add_cod;";
                        $remetente = $funcoes->executarSQL($sql, $post_data, '')['remetente_fk'];

                        if ($remetente == $sessao->cod_usuario) {
                            $sql = "update trbl_correcao_trabalho set status = 0 where cod_correcao = :add_cod;";
                            $funcoes->executarSQL($sql, $post_data);
                        } else {
                            $sql = "update trbl_correcao_trabalho set status = 1 where cod_correcao = :add_cod;";
                            $funcoes->executarSQL($sql, $post_data);
                        }

                        $sql = "insert into trbl_correcao_historico (cod_correcao_fk, usuario_fk, observacao, data_envio, arquivo) values (:add_cod, :usuario, :add_observacao, now(), :arquivo_nome);";
                        $funcoes->executarSQL($sql, $post_data);

                        return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Trabalho Enviado!')));
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

    public function deleteHistoricoAction() {
        $funcoes = new Funcoes($this);
        $response = $this->getResponse();

        $params = array(
            'cod' => $this->params()->fromPost('cod', ''),
        );

        $sql = "delete from trbl_correcao_historico where cod_historico=:cod";
        $funcoes->executarSQL($sql, $params);

        return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Trabalho de Correção Excluída!')));
    }
    
     public function recebidosAction() {
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

        $sql = "call us_buscarTrabalhosRecebidos_sp(:filtro,:pesquisa,'0',:cod_usuario)";
        $result = $funcoes->executarSQL($sql, $params);

        $relatorio->definirColuna('MEMBRO', 'nome', '4', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('DATA ENVIO', 'data', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('MODALIDADE', 'modalidade', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('STATUS', 'status_desc', '2', 'center', 't', 'n', 'n', '[cor]');

        $relatorio->definirColuna('Correções', '1', '2', 'center', 't', 'n', 'n');
  
        $view = new ViewModel(array(
            'result' => $result,
            'membros' => $membros,
            'relatorio' => $relatorio,
            'filtro' => $params['filtro'],
            'pesq' => $params['pesquisa']
        ));
        $view->setTemplate('quadro/recebidos-correcao');
        return $view;
    }
    

}
