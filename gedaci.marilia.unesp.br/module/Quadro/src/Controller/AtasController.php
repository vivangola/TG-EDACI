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

class AtasController extends AbstractActionController
{
    public function atasAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        $relatorio = new Relatorio();
        
        $params = array(
            'cod_usuario' => $sessao->cod_usuario,
            'filtro'    => $this->params()->fromPost('filtros', '-1'),
            'pesquisa'  => $this->params()->fromPost('pesquisa', ''),
        );
        
        if($params['filtro'] == '-1'){
            $params['pesquisa'] = '';
        }
        
        $sql = "call us_buscarAtas_sp(:filtro,:pesquisa,'0')";
        $atas = $funcoes->executarSQL($sql,$params);
        
        $relatorio->definirColuna('CONTEÚDO SINTÉTICO', 'conteudo', '8', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('USUÁRIO', 'usuario', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('DATA REUNIÃO', 'dt_convert', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('VISUALIZAR', '1', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('ALTERAR', '2', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('EXCLUIR', '3', '2', 'center', 't', 'n', 'n');
        
        $view = new ViewModel(array(
            'atas' => $atas,
            'relatorio' => $relatorio,
            'filtro' => $params['filtro'],
            'pesq' => $params['pesquisa']
        ));
        
        $view->setTemplate('quadro/atas');
        return $view;
    }
    
    public function addAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $response = $this->getResponse();
        $request = $this->getRequest();
        
        if($request->isPost()){
            $params = array(
                'conteudo'      => $this->params()->fromPost('add_conteudo', ''),
                'dt'            => $this->params()->fromPost('add_dt', ''),
                'h'             => $this->params()->fromPost('add_h', '00:00'),
                'usuario'       => $sessao->cod_usuario
            );

            $arquivo = $this->params()->fromFiles('add_arquivo', '');

            $params['dt'] = $params['dt'] . ' ' . $params['h'];

            $params['arquivo_nome'] = '/arquivos/atas/ata-' . date("Y-m-d-H-m-s");

            $sql = "insert into reu_atas(data_inclusao,conteudo,texto,data,usuario_fk) " .
                        "values(now(),:conteudo,:arquivo_nome,:dt,:usuario);";
            $funcoes->executarSQL($sql,$params);

            $funcoes->alertBasic('Ata adicionada.', false, '/atas', 'success', 'Sucesso!');
            exit;
        }else{
            header('Location: /atas');
            exit;
        }
    }
    
    public function deleteAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $response = $this->getResponse();
        
        $params = array(
            'ata'           => $this->params()->fromPost('cod_ata', ''),
            'usuario'       => $sessao->cod_usuario
        );
        
        $sql = "delete from reu_atas where cod_ata =:ata";
        $funcoes->executarSQL($sql,$params);
        
        return $response->setContent(Json::encode(array('response' => true)));
    }
}
