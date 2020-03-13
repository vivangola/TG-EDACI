<?php

/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Application\Controller;

use Application\Classes\PHPMailer;
use Application\Classes\Funcoes;
use Application\Classes\Relatorio;
use Zend\Json\Json;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Session\Container;
use Zend\View\Model\ViewModel;

class UsuariosController extends AbstractActionController {

    public function membrosAction() {
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

        $sql = "call us_BuscarMembros_sp (:cod_usuario)";
        $membros = $funcoes->executarSQL($sql, $params);

        $relatorio->definirColuna('FOTO', '0', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('NOME', '10', '10', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('TIPO', 'tipo_usuario_desc', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('ESCOLARIDADE', 'escolaridade_descricao', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('DATA ENTRADA', 'data_criacao', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('INATIVO / ATIVO', '1', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('ACEITAR / RECUSAR PRÉ-CADASTRO', '2', '4', 'center', 't', 'n', 'n');

        $view = new ViewModel(array(
            'membros' => $membros,
            'relatorio' => $relatorio,
            'filtro' => $params['filtro'],
            'pesq' => $params['pesquisa']
        ));

        $view->setTemplate('application/usuarios/membros');
        return $view;
    }

    public function ativarAction() {
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");

        $response = $this->getResponse();

        $params = array(
            'cod_usuario' => $sessao->cod_usuario,
            'user' => $this->params()->fromPost('cod_usuario', '0'),
            'ativar' => $this->params()->fromPost('ativar', '0')
        );

        $sql = "update us_acesso set situacao =:ativar where cod_usuario_fk =:user";
        $funcoes->executarSQL($sql, $params);

        return $response->setContent(Json::encode(array('response' => true)));
    }

    public function aceitarAction() {
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");

        $response = $this->getResponse();

        $params = array(
            'adm' => $sessao->cod_usuario,
            'usuario' => $this->params()->fromPost('cod_usuario', '-1'),
            'aceitar' => $this->params()->fromPost('aceitar', '0'),
        );
        
        $sqlEmail = "select nome, email from us_pre_cadastro where cod_usuario = :usuario";
        $email = $funcoes->executarSQL($sqlEmail, $params, '');
        
        if($params['aceitar'] == '1'){
            $envio = $this->enviarEmail($email);
            if (!$envio) {
                return $response->setContent(Json::encode(array('response' => false, 'msg' => 'Erro ao enviar o email. Contate o(s) Desenvolvedor(es).')));
            }
        }

        $sql = "call us_aceitarPreCadastro_sp (:adm,:usuario,:aceitar)";
        $result = $funcoes->executarSQL($sql, $params, '');


        return $response->setContent(Json::encode(array('response' => true, 'msg' => $result['msg'])));
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
                                                    'PR&Eacute;-CADASTRO REALIZADO'.
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
                                                '<td style="font:13px Arial;" width="350">'.
                                                    '<p> '.
                                                        'Ol&aacute; <b>'.strtoupper($params['nome']).'</b>, seu pr&eacute;-cadastro foi aceito pelo admistrador do <b>Grupo Edaci</b>. Utilize os dados abaixo para ter acesso ao sistema.'.
                                                        '<br><br><br>'.
                                                        "<a style href='http://gedaci.marilia.unesp.br/login'>Clique aqui</a> para ir at&eacute; o sistema.".
                                                    '</p>'.
                                                    '<table align="center" border="0" cellpadding="0" cellspacing="0" style="width:650px;border:1px solid #629bad">'.
                                                        '<thead>'.
                                                            '<tr style="border:white;color:white;background-color:#629bad;font-size:15px">'.
                                                                '<td style="padding:10px">'.
                                                                    'Login'.
                                                                '</td>'.
                                                            '</tr>'.
                                                        '<thead>'.
                                                        '<tbody style="font-size:15px">'.
                                                                '<tr style="background:#ffffff">'.
                                                                    '<td style="padding:5px 10px;text-align:left;">'.
                                                                        $params['email'].
                                                                    '</td>'.
                                                                '</tr>'.
                                                        '</tbody>'.
                                                    '</table>'.
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
            $mail->Subject = 'CADASTRO GRUPO EDACI';
            $mail->Body = $tabela;
            $mail->send();
            return true;
        } catch (Exception $e) {
            return false;
        }
    }

    public function logAction() {
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

        $sql = "call us_log_sp (:filtro,:pesquisa)";
        $log = $funcoes->executarSQL($sql, $params);

        $relatorio->definirColuna('USUÁRIO', 'user', '4', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('APLICACÃO', 'aplicacao', '4', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('DATA ENTRADA', 'data_movimento', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('DATA SAÍDA', 'data_movimento_fim', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('TEMPO NA APLICAÇÃO', '1', '4', 'center', 't', 'n', 'n');

        $relatorio->definirLink('aplicacao', '[link]');

        $view = new ViewModel(array(
            'membros' => $log,
            'relatorio' => $relatorio,
            'filtro' => $params['filtro'],
            'pesq' => $params['pesquisa']
        ));

        $view->setTemplate('application/usuarios/log');
        return $view;
    }

}
