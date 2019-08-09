<?php
/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Application\Controller;

use Application\Classes\Funcoes;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Session\Container;
use Zend\View\Model\ViewModel;

class PerfilController extends AbstractActionController
{
    public function perfilAction(){
        
        $view = new ViewModel();
        
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
    
}
