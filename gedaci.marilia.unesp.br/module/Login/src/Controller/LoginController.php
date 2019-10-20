<?php
/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Login\Controller;

use Application\Classes\Funcoes;
use Zend\Json\Json;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Session\Container;
use Application\Classes\PHPMailer;
use Zend\View\Model\ViewModel;

class LoginController extends AbstractActionController
{
    public function loginAction(){
        $view = new ViewModel();
        
        $view->setTemplate('login/login');
        return $view;
    }
    
    public function acessarAction(){
        $funcao = new Funcoes($this);
        
        $response = $this->getResponse();
        $request = $this->getRequest();
        
        if($request->isPost()){
        
            $sql = "call sys_Login_sp (:login)";
            $params = array(
                'login' => $this->params()->fromPost('login','0'),
                'senha' => $this->params()->fromPost('senha','0'),
            );
            $result = $funcao->executarSQL($sql,$params, '');
            
            if($result['cod'] == '1'){
                return $response->setContent(Json::encode(array('response' => false, 'msg' => $result['msg'])));
            }
            
            if($result['senha_usuario'] != md5($params['senha'])){
                return $response->setContent(Json::encode(array('response' => false, 'msg' => 'Senha ou/e Login não estão corretos.')));
            }
            
            if($result['cod'] == '0'){
                $sql = "call us_BuscarDados1_sp(:cod)";
                $result2 = $funcao->executarSQL($sql, array('cod' => $result['cod_usuario']), '');

                $sessao = new Container('usuario');

                $sessao->cod_usuario = $result['cod_usuario'];
                $sessao->nome_usuario = $result2['nome'];
                $sessao->tipo_usuario = $result2['tipo_usuario'];
                $sessao->situacao = $result2['situacao'];
                $sessao->tipo_usuario_desc = $result2['tipo_usuario_desc'];
                $sessao->foto_perfil = $result2['nome_foto'];

                return $response->setContent(Json::encode(array('response' => true)));
            }else{
                return $response->setContent(Json::encode(array('response' => false, 'msg' => $result['msg'])));
            }
        }else{
            header('Location: /');
            exit;
        }
    }
    
    public function esqueciSenhaAction(){
        $view = new ViewModel();
        
        $view->setTemplate('login/esqueci-senha');
        return $view;
    }
    
    public function recuperarSenhaAction(){
        $funcoes = new Funcoes($this);
        
        $response = $this->getResponse();
        $request = $this->getRequest();
    
        if($request->isPost()){
            
            $params = ['email' => $this->params()->fromPost('email', '')];
             
            $sqlLogin = "select a.login, b.nome from us_acesso a inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario where a.login = :email";
            $login = $funcoes->executarSQL($sqlLogin, $params, '');
            
            if (!$login) {
                $sqlLogin = "select a.login, b.nome from us_acesso a inner join us_pre_cadastro b on a.cod_usuario_fk = b.cod_usuario where a.login = :email";
                $login = $funcoes->executarSQL($sqlLogin, $params, '');
            }
            
            if (!$login) {
                $funcoes->alertBasic('Usuário não encontrado. Por favor tente novamente!', false, '/', 'info', 'Ops...');
                exit;
            }
            
            $login['senha'] = $this->gerarSenha();
            $login['md5'] = md5($login['senha']);
                                 
            $sql = "update us_acesso set senha = :md5 where login = :login";
            $funcoes->executarSQL($sql, $login);

            $envio = $this->enviarEmail($login);
            if (!$envio) {
                $funcoes->alertBasic('Erro ao enviar o email. Contate os Desenvolvedores!', false, '/', 'info', 'Ops...');
                exit;
            }
            
            $funcoes->alertBasic('Sua nova senha foi enviada no seu e-mail!', false, '/', 'success', 'Sucesso!');
            exit;
        }
     }
    
    public function logoutAction(){
        $response = $this->getResponse();
        $request = $this->getRequest();
        
        $sessao = new Container('usuario');
        $sessao->getManager()->destroy();
        $sessao->getManager()->getStorage()->clear();
        
        if($request->isPost()){
            return $response->setContent(Json::encode(array('response' => true)));
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
                                                    'RECUPERA&Ccedil;&Atilde;O DE SENHA'.
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
                                                        'Ol&aacute; <b>'.strtoupper($params['nome']).'</b>, sua senha foi atualizada. Utilize os dados abaixo para ter acesso ao sistema.'.
                                                        '<br><br><br>'.
                                                        "<a style href='http://gedaci.marilia.unesp.br/login'>Clique aqui</a> para ir at&eacute; o sistema.".
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
                                                                        $params['login'].
                                                                    '</td>'.
                                                                    '<td style="padding:5px 10px;text-align:left;">'.
                                                                        $params['senha'].
                                                                    '</td>'.
                                                                '</tr>'.
                                                        '</tbody>'.
                                                    '</table>'.
                                                    '<p> '.
                                                        '<i>Obs: Voc&ecirc; poder&aacute; alterar sua senha.</i>'.
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
            $mail->addAddress($params['login'], $params['nome']);
            $mail->isHTML(true);
            $mail->Subject = 'SENHA GRUPO EDACI';
            $mail->Body = $tabela;
            $mail->send();
            return true;
        } catch (Exception $e) {
            return false;
        }
    }
    
    public function sessaoValuesAction(){
        $response = $this->getResponse();
        
        $sessao = new Container('usuario');
        
        echo "<h1>print_r >> var_dump</h1>";
        echo "<pre>";
        print_r($sessao->getArrayCopy());
        echo "</pre>";
        echo "<pre>";
        var_dump($sessao->getArrayCopy());
        echo "</pre>";
        exit;
    }
    
}
