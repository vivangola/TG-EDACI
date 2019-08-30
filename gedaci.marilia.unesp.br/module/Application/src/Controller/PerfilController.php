<?php
/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Application\Controller;

use Application\Classes\Funcoes;
use Zend\Json\Json;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Session\Container;
use Zend\View\Model\ViewModel;

class PerfilController extends AbstractActionController
{
    public function perfilAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $params = array(
            'cod_usuario'   => $sessao->cod_usuario
        );
        
        $sql = "call us_buscarDadosPrincipal_sp (:cod_usuario)";
        $result = $funcoes->executarSQL($sql, $params, '');
        
        echo "<pre>";
        var_dump($result);
        echo "</pre>";
        
        $sql = "select cod_nivel,descricao from nivel_escolaridade order by descricao";
        $escolaridades = $funcoes->executarSQL($sql,[]);
        
        $view = new ViewModel(array(
            'usuario'        => $result,
            'escolaridades'  => $escolaridades
        ));
        
        $view->setTemplate('application/perfil/perfil');
        return $view;
    }
    
    
    public function fotoPerfilAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $response = $this->getResponse();
        $request = $this->getRequest();
        
        if($request->isPost()){
            $params = array(
                'usuario'       => $sessao->cod_usuario
            );
            
            $arquivo = $this->params()->fromFiles('foto_perfil_file', '');
            
            $ext = pathinfo($arquivo['name'], PATHINFO_EXTENSION);
            
            $dir = $_SERVER['DOCUMENT_ROOT']. '/arquivos/perfil/';
            
            $params['arquivo_nome'] = 'foto-perfil-' . $params['usuario'] . '.' . 'jpg';
            
            $destino = $dir . $params['arquivo_nome'];
            
            if(file_exists($destino)){
                unlink($destino);
            }

            move_uploaded_file($arquivo['tmp_name'], $destino);

            $funcoes->alertBasic('Foto de Perfil alterada com sucesso.', false, '/', 'success', 'Sucesso!');
            exit;
        }else{
            header('Location: /');
            exit;
        }
    }
    
    public function alterarSenhaAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $view = new ViewModel();
        $view->setTemplate('application/perfil/alterar-senha');
        return $view;
    }
    
    public function salvarSenhaAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $response = $this->getResponse();
        $request = $this->getRequest();
        
        if($request->isPost()){
            $params = array(
                'ant'       => $this->params()->fromPost('senha_ant', ''),
                'nova'      => $this->params()->fromPost('senha_nova', ''),
                'conf'      => $this->params()->fromPost('senha_nova_conf', ''),
                'usuario'   => $sessao->cod_usuario,
            );
            
            $sql = "select senha from us_acesso where cod_usuario_fk =:usuario;";
            $result = $funcoes->executarSQL($sql, $params, '');
            
            if($result['senha'] != md5($params['ant'])){
                return $response->setContent(Json::encode(array('response' => false, 'msg' => 'Senha anterior digitada não é valida. Digite sua senha anterior.')));
            }else{
                $sql = "update us_acesso set senha = :pass where cod_usuario_fk =:usuario;";
                $funcoes->executarSQL($sql, array('pass' => md5($params['nova']), 'usuario' => $params['usuario']));       
                
                return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Senha alterada com sucesso.')));
            }
        }else{
            header('Location: /');
            exit;
        }
    }
}
