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

class QuadroLeituraController extends AbstractActionController
{
    public function quadroLeituraAction(){
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
        
        $sql = "call us_buscarLeitura_sp(:filtro,:pesquisa,'0')";
        $result = $funcoes->executarSQL($sql,$params);
        
        $relatorio->definirColuna('TÍTULO DO ARTIGO', 'titulo_artigo', '8', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('TÍTULO DO PERIÓDICO', 'titulo_periodico', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('AUTOR(es)', 'autor', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('VOLUME', 'volume', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('MÊS/ANO', 'mes_ano', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('PÁGINA', 'pagina', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('USUÁRIO', 'usuario', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('DATA PESQUISA', 'data_pesquisa', '4', 'center', 't', 'n', 'n');
        
        $relatorio->definirColuna('DOWNLOAD', '1', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('ALTERAR', '2', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('EXCLUIR', '3', '2', 'center', 't', 'n', 'n');
        
        $view = new ViewModel(array(
            'result'    => $result,
            'relatorio' => $relatorio,
            'filtro'    => $params['filtro'],
            'pesq'      => $params['pesquisa']
        ));
        
        $view->setTemplate('quadro/quadro-leitura');
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
                'base'              => $this->params()->fromPost('add_base', ''), 
                'data_pesquisa'     => $this->params()->fromPost('add_datapesq', ''), 
                'titulo_periodico'  => $this->params()->fromPost('add_periodico', ''), 
                'ano'               => $this->params()->fromPost('add_ano', ''), 
                'mes'               => $this->params()->fromPost('add_mes', ''), 
                'volume'            => $this->params()->fromPost('add_volume', ''), 
                'numero'            => $this->params()->fromPost('add_numero', ''), 
                'titulo_artigo'     => $this->params()->fromPost('add_artigo', ''), 
                'autor'             => $this->params()->fromPost('add_autor', ''), 
                'pagina_inicial'    => $this->params()->fromPost('add_pginicial', ''), 
                'pagina_final'      => $this->params()->fromPost('add_pgfim', ''), 
                'interesse'         => $this->params()->fromPost('add_interesse', ''), 
                //'arquivo'           => $this->params()->fromPost('arquivo', ''), 
            ); 
            
            $arquivo = $this->params()->fromFiles('add_arquivo', '');
            
            if($arquivo){
                $ext = pathinfo($arquivo['name'], PATHINFO_EXTENSION);

                $dir = $_SERVER['DOCUMENT_ROOT']. '/arquivos/leitura/';

                if(!file_exists($dir)){
                    mkdir($dir, 0777);
                }

                $params['arquivo_nome'] = 'material-' . date("Y-m-d-H-m-s") . '.' . $ext;

                $destino = $dir . $params['arquivo_nome'];

                move_uploaded_file($arquivo['tmp_name'], $destino);

                if(file_exists($destino)){

                    $sql = "insert into ltr_material_leitura(cod_usuario_fk, base, data_pesquisa, titulo_periodico, ano, mes, volume, numero, titulo_artigo, autor, pagina_inicial, pagina_final, interesse, arquivo, data_criacao) " .
                                "values(:usuario, :base, :data_pesquisa, :titulo_periodico, :ano, :mes, :volume, :numero, :titulo_artigo, :autor, :pagina_inicial, :pagina_final, :interesse, :arquivo_nome, now());";
                    $funcoes->executarSQL($sql,$params);

                    return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Material Adicionado.')));
                } else{
                    return $response->setContent(Json::encode(array('response' => false, 'msg' => 'Erro ao adicionar o Material.')));    
                }
            }else{
                 $sql = "insert into ltr_material_leitura(cod_usuario_fk, base, data_pesquisa, titulo_periodico, ano, mes, volume, numero, titulo_artigo, autor, pagina_inicial, pagina_final, interesse, arquivo, data_criacao) " .
                                "values(:usuario, :base, :data_pesquisa, :titulo_periodico, :ano, :mes, :volume, :numero, :titulo_artigo, :autor, :pagina_inicial, :pagina_final, :interesse, '', now());";
                    $funcoes->executarSQL($sql,$params);

                    return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Material Adicionado.')));
            }
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
        
        $sql = "delete from ltr_material_leitura where cod_material =:cod";
        $funcoes->executarSQL($sql,$params);
        
        return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Material deletado.')));
    }
}
