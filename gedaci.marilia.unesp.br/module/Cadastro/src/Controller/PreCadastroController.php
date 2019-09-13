<?php
/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Cadastro\Controller;

use Application\Classes\Funcoes;
use Exception;
use Application\Classes\PHPMailer;
use Zend\Json\Json;
use Zend\Mail\Message as Message2;
use Zend\Mail\Transport\Smtp;
use Zend\Mail\Transport\SmtpOptions;
use Zend\Mime\Message;
use Zend\Mime\Part;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\JsonModel;
use Zend\View\Model\ViewModel;

class PreCadastroController extends AbstractActionController
{
    public function preCadastroAction(){
        $funcoes = new Funcoes($this);
        
        $sql = "select cod_nivel,descricao from nivel_escolaridade order by descricao";
        $escolaridades = $funcoes->executarSQL($sql,[]);
        
        $view = new ViewModel(array(
            'escolaridades' => $escolaridades
        ));
        
        $view->setTemplate('cadastro/pre-cadastro');
        return $view;
    }
    
    
    public function novoAction(){
        $funcoes = new Funcoes($this);
        
        $response = $this->getResponse();
        $request  = $this->getRequest();
        
        if($request->isPost()){
            $params = array(
                'nome'          => $this->params()->fromPost('nome', 'Gabriel da Silva'),
                'email'         => $this->params()->fromPost('email', 'gabriel-xp288@hotmail.com'),
                'escolaridade'  => $this->params()->fromPost('escolaridade', ''),
                'senha'         => $this->gerarSenha()
            );
            
            $params['pass'] = $params['senha'];
            
            $this->enviarEmail($params);
            
            $params['senha'] = md5($params['senha']);
            
            $sql = "call sys_novoPreCadastro_sp(:nome,:email,:escolaridade,:senha,1)";
            $result = $funcoes->executarSQL($sql,$params, '');

            if(!$result){
                return $response->setContent(Json::encode(array('response' => false, 'msg' => 'Erro ao realizar o seu pré-cadastro.<br>Por favor tente novamente em alguns segundos.')));
            }else{
                if($result['cod'] == '0'){
                    $retorno = true;
                }else{
                    $retorno = false;
                }
                return $response->setContent(Json::encode(array('response' => $retorno, 'msg' => $result['msg'])));
            }
        }else{
            header('Location: /');
            exit;
        }
    }
    
    private function gerarSenha(){
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < 10; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }
    
    private function enviarEmail($params){
        $funcao = new Funcoes($this);
        
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
                                                    'PRÉ-CADASTRO REALIZADO'.
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
                                                        'Olá <b>'.strtoupper($params['nome']).'</b>, seu pré-cadastro foi realizado pelo admistrador do <b>Grupo Edaci</b>. Utilize os dados abaixo para ter acesso ao sistema.'.
                                                        '<br><br><br>'.
                                                        "<a style href='http://gedaci.marilia.unesp.br/login'>Clique aqui</a> para ir até o sistema.".
                                                    '</p>'.
                                                    '<table align="center" border="0" cellpadding="0" cellspacing="0" style="width:650px;border:1px solid #629bad">'.
                                                        '<thead>'.
                                                            '<tr style="border:white;color:white;background-color:#629bad;font-size:15px">'.
                                                                '<td style="padding:10px">'.
                                                                    'Login'.
                                                                '</td>'.
                                                                '<td style="padding:10px">'.
                                                                    'Senha'.
                                                                '</td>'.
                                                            '</tr>'.
                                                        '<thead>'.
                                                        '<tbody style="font-size:15px">'.
                                                                '<tr style="background:#ffffff">'.
                                                                    '<td style="padding:5px 10px;text-align:left;">'.
                                                                        'Seu Email'.
                                                                    '</td>'.
                                                                    '<td style="padding:5px 10px;text-align:left;">'.
                                                                        $params['senha'].
                                                                    '</td>'.
                                                                '</tr>'.
                                                        '</tbody>'.
                                                    '</table>'.
                                                    '<p> '.
                                                        '<i>Obs: Você poderá alterar sua senha.</i>'.
                                                        '<br><br><br>'.
                                                    '</p>'.
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
                                                        'teste@teste.com.br'.
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
        
        echo $tabela;
        
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
            $mail->addAddress('silvio.candido@unesp.br', 'Silvio');
            $mail->isHTML(true);
            $mail->Subject = 'TITULO';
            $mail->Body = 'CONTEUDO';
            $mail->send();
        } catch (Exception $e) {
                
        }
    }
}
