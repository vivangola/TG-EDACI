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

class ProducaoGrupoController extends AbstractActionController
{
    public function producaoGrupoAction(){
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
        
        $sql = "call us_buscarProducaoGrupo_sp(:filtro,:pesquisa,'0')";
        $result = $funcoes->executarSQL($sql,$params);
        
        $relatorio->definirColuna('ORIGEM', 'origem', '8', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('TÍTULO', 'titulo', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('AUTOR(es)', 'autor', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('MODALIDADE', 'modalidade', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('NOME', 'nome', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('QUALIS', 'qualis', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('FORMATO', 'qualis', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('DATA PUBLICAÇÃO', 'data_publicacao', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('LINK', 'link', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('ESCLARECIMENTOS', 'esclarecimentos', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('STATUS', 'status', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('DATA SUBMISSÃO', 'data_submissao', '2', 'center', 't', 'n', 'n');
        
        $relatorio->definirColuna('DOWNLOAD', '1', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('ALTERAR', '2', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('EXCLUIR', '3', '2', 'center', 't', 'n', 'n');
        
        $view = new ViewModel(array(
            'result'    => $result,
            'relatorio' => $relatorio,
            'filtro'    => $params['filtro'],
            'pesq'      => $params['pesquisa']
        ));
        $view->setTemplate('quadro/producao-grupo');
        return $view;
    }
    
    public function addAction(){
        
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $response = $this->getResponse();
        $request = $this->getRequest();
        
        if($request->isPost()){
            
            $post_data = $this->params()->fromPost();
            $post_data['usuario'] = $sessao->cod_usuario;
            
            $arquivo = $this->params()->fromFiles('add_arquivo', '');
            
            if($arquivo){
                $ext = pathinfo($arquivo['name'], PATHINFO_EXTENSION);

                $dir = $_SERVER['DOCUMENT_ROOT']. '/arquivos/producao-grupo/';

                if(!file_exists($dir)){
                    mkdir($dir, 0777);
                }

                $post_data['arquivo_nome'] = 'producao-' . date("Y-m-d-H-m-s") . '.' . $ext;

                $destino = $dir . $post_data['arquivo_nome'];

                move_uploaded_file($arquivo['tmp_name'], $destino);

                if(file_exists($destino)){

                    $sql = "insert into producao_grupo (cod_usuario_fk, origem, titulo, autor, modalidade, nome, qualis, link, esclarecimentos, status, data_publicacao, data_submissao, formato, arquivo) " .
                           "values (:usuario, :add_origem, :add_titulo, :add_autor, :add_modalidade, :add_nome, :add_qualis, :add_link, :add_esclarecimento, :add_status, :add_publicacao, now(), :add_formato, :arquivo_nome);";
                    $funcoes->executarSQL($sql,$post_data);

                    return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Produção de Grupo Adicionado.')));
                } else{
                    return $response->setContent(Json::encode(array('response' => false, 'msg' => 'Erro ao adicionar Produção de Grupo.')));    
                }
            }else{
                $sql = "insert into producao_grupo (cod_usuario_fk, origem, titulo, autor, modalidade, nome, qualis, link, esclarecimentos, status, data_publicacao, data_submissao, formato) " .
                           "values (:usuario, :add_origem, :add_titulo, :add_autor, :add_modalidade, :add_nome, :add_qualis, :add_link, :add_esclarecimento, :add_status, :add_publicacao, now(), :add_formato);";
                $funcoes->executarSQL($sql,$post_data);

                return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Produção de Grupo Adicionado.')));
            }
        }else{
            return $response->setContent(Json::encode(array('response' => false)));
        }
    }
    
     public function deleteAction(){
        $funcoes = new Funcoes($this);
        $response = $this->getResponse();
        
        $params = array(
            'cod'   => $this->params()->fromPost('cod', ''),
        );
        
        $sql = "delete from producao_grupo where cod_producao=:cod";
        $funcoes->executarSQL($sql,$params);
        
        return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Produção de Grupo excluída.')));
    }
}
