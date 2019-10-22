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

class EmailsController extends AbstractActionController {

    public function emailAction() {
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

        $sql = "call us_buscarEmails_sp (:filtro,:pesquisa,'0',:cod_usuario)";
        $result = $funcoes->executarSQL($sql, $params);
        
        $relatorio->definirColuna('EMAIL DESTINATARIO', 'email_destinatario', '2', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('ASSUNTO', 'assunto', '10', 'left', 't', 'n', 'n');
        //$relatorio->definirColuna('USUÁRIO', 'nome', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('DATA ENVIO', 'data', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('VISUALIZAR', '1', '2', 'center', 't', 'n', 'n');
   
        $view = new ViewModel(array(
            'result' => $result,
            'relatorio' => $relatorio,
            'filtro' => $params['filtro'],
            'pesq' => $params['pesquisa']
        ));

        $view->setTemplate('application/emails/emails');
        return $view;
    }
    
    public function addAction() {

        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $response = $this->getResponse();
        $request = $this->getRequest();

        if ($request->isPost()) {

            $post_data = $this->params()->fromPost();
            $post_data['add_usuario'] = $sessao->cod_usuario;
            $sql = "select nome, email from us_usuario where cod_usuario = :add_usuario;";
            $result = $funcoes->executarSQL($sql, $post_data, '');
            
            $post_data['add_remetente'] = $result['email'];
            $post_data['nome'] = $result['nome'];
            
            $emails = explode(",", $post_data['add_emails']);
            
            $cont = 0;
            $erros = 0;
            foreach($emails as $dados){
                $post_data['add_destinatario'] = $dados;
                if($this->enviarEmail($post_data)){
                    $sql = "INSERT INTO emails_enviados (email_destinatario, assunto, texto, cod_usuario_fk, data_envio) "
                            . "VALUES (:add_destinatario, :add_assunto, :add_texto, :add_usuario, now());";
                    $funcoes->executarSQL($sql, $post_data);
                    
                    $cont++;

                }else{
                    $erros++;
                }
            }
            return $response->setContent(Json::encode(array('response' => true, 'msg' => $cont.' e-mails enviados e '.$erros.' com erros!')));
        }
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

            $sql = "call us_buscarEmails_sp(0,'',:cod, :usuario)";
            $result = $funcoes->executarSQL($sql, $params, '');

            return $response->setContent(Json::encode(array('response' => true, 'result' => $result)));
        } else {
            header('Location: /email');
            exit;
        }
    }
    

    private function enviarEmail($params) {
        
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
            $mail->setFrom($params['add_remetente'], $params['nome']);
            $mail->addAddress($params['add_destinatario'], 'GEDACI');
            $mail->isHTML(true);
            $mail->Subject = $params['add_assunto'];
            $mail->Body = $params['add_texto'];
            $mail->send();
            return true;
        } catch (Exception $e) {
            return false;
        }
    }
    

}
