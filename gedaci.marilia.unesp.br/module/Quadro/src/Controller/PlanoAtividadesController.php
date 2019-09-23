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

class PlanoAtividadesController extends AbstractActionController
{
    public function atividadesAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        $relatorio = new Relatorio();
        
        $params = array(
            'cod_usuario'   => $sessao->cod_usuario,
            'filtro'        => $this->params()->fromPost('filtros', '-1'),
            'pesquisa'      => $this->params()->fromPost('pesquisa', ''),
            'is_adm'        => $sessao->tipo_usuario == 1 ? 1 : 0
        );
        
        if($params['filtro'] == '-1'){
            $params['pesquisa'] = '';
        }
        
        $sql = "call us_buscarAtividades_sp(:filtro,:pesquisa,'0',null,null,:is_adm)";
        $result = $funcoes->executarSQL($sql,$params);
        
        $sql = "select * from atvs_plano_atividades_tipo";
        $tipos = $funcoes->executarSQL($sql, []);
        
        $sql = "select * from atvs_plano_atividades_status";
        $status = $funcoes->executarSQL($sql, []);
        
        $relatorio->definirColuna('DESCRIÇÃO', 'descricao', '8', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('TIPO DE ATIVIDADE', 'tipo_atividade', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('STATUS', 'status', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('USUÁRIO', 'usuario', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('MÊS/ANO', 'mes_ano', '2', 'center', 't', 'n', 'n');
        
        $relatorio->definirColuna('ALTERAR', '2', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('EXCLUIR', '3', '2', 'center', 't', 'n', 'n');
        
        $view = new ViewModel(array(
            'result'    => $result,
            'relatorio' => $relatorio,
            'filtro'    => $params['filtro'],
            'pesq'      => $params['pesquisa'],
            'is_adm'    => $sessao->tipo_usuario == 1 ? 1 : 0,
            'tipos'     => $tipos,
            'status'    => $status
        ));
        
        $view->setTemplate('quadro/quadro-atividades');
        return $view;
    }
    
    public function addAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $response = $this->getResponse();
        $request = $this->getRequest();
        
        if($request->isPost()){
            $params = array(
                'usuario'           => $sessao->cod_usuario,
                'descricao'         => $this->params()->fromPost('add_desc', ''), 
                'tipo'              => $this->params()->fromPost('add_tipo', ''), 
                'status'            => $this->params()->fromPost('add_status', ''), 
                'ano'               => $this->params()->fromPost('add_ano', ''), 
                'mes'               => $this->params()->fromPost('add_mes', ''), 
            ); 
            
            $sql = "insert into atvs_plano_atividades(cod_usuario_fk, descricao, mes, ano, status, tipo_atividade_fk, data_criacao) " .
                                "values(:usuario,:descricao,:tipo,:status,:ano,:mes,now());";
            $funcoes->executarSQL($sql,$params);

            return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Atividade Adicionada.')));
        }else{
            return $response->setContent(Json::encode(array('response' => false)));
        }
    }
    
    public function showEditAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $response = $this->getResponse();
        $request  = $this->getRequest();
        
        if($request->isPost()){
            $params = array(
                'usuario'   => $sessao->cod_usuario,
                'cod'       => $this->params()->fromPost('cod', '-1'),
            );

            $sql = "call us_buscarLeitura_sp('','',:cod)";
            $result = $funcoes->executarSQL($sql,$params,'');

            return $response->setContent(Json::encode(array('response' => true, 'result' => $result)));
        }else{
            header('Location: /quadro-leitura');
            exit;
        }
    }
    
    public function editAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $response = $this->getResponse();
        $request = $this->getRequest();
        
        if($request->isPost()){
            $params = array(
                'usuario'           => $sessao->cod_usuario,
                'cod'               => $this->params()->fromPost('cod'),
                'base'              => $this->params()->fromPost('base', ''), 
                'data_pesquisa'     => $this->params()->fromPost('data_pesq', ''), 
                'titulo_periodico'  => $this->params()->fromPost('titulo_periodico', ''), 
                'ano'               => $this->params()->fromPost('ano', ''), 
                'mes'               => $this->params()->fromPost('mes', ''), 
                'volume'            => $this->params()->fromPost('volume', ''), 
                'numero'            => $this->params()->fromPost('numero', ''), 
                'titulo_artigo'     => $this->params()->fromPost('titulo_artigo', ''), 
                'autor'             => $this->params()->fromPost('autor', ''), 
                'pagina_inicial'    => $this->params()->fromPost('pginicial', ''), 
                'pagina_final'      => $this->params()->fromPost('pgfim', ''), 
                'interesse'         => $this->params()->fromPost('interesse', ''), 
                //'arquivo'           => $this->params()->fromPost('arquivo', ''), 
            ); 
            
            /*
            $arquivo = $this->params()->fromFiles('add_arquivo', '');
            
            $ext = pathinfo($arquivo['name'], PATHINFO_EXTENSION);
            
            $dir = $_SERVER['DOCUMENT_ROOT']. '/arquivos/leitura/';
            
            $params['arquivo_nome'] = 'material-' . date("Y-m-d-H-m-s") . '.' . $ext;
            
            $destino = $dir . $params['arquivo_nome'];
            
            move_uploaded_file($arquivo['tmp_name'], $destino);
            */
            
            $sql = "update ltr_material_leitura set base = :base, data_pesquisa =:data_pesquisa, titulo_periodico =:titulo_periodico, ano=:ano, mes=:mes, volume=:volume, numero=:numero, titulo_artigo=:titulo_artigo, autor=:autor, pagina_inicial =:pagina_inicial, pagina_final =:pagina_final, interesse=:interesse where cod_material =:cod";
            $funcoes->executarSQL($sql,$params);
            
            return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Alterado com sucesso.')));
        }else{
            return $response->setContent(Json::encode(array('response' => false)));
        }
    }
    
    public function deleteAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $response = $this->getResponse();
        
        $params = array(
            'cod'   => $this->params()->fromPost('cod', ''),
        );
        
        $sql = "delete from atvs_plano_atividades where cod_atividade =:cod";
        $funcoes->executarSQL($sql,$params);
        
        return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Atividade deletada.')));
    }
}
