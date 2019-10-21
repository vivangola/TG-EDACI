<?php
/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Quadro\Controller;

use Application\Classes\Funcoes;
use Zend\Json\Json;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Session\Container;
use Zend\View\Model\ViewModel;

class PlanoMetasController extends AbstractActionController
{
    public function PlanoMetasAction(){
        
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $params = array(
            'mes' => $this->params()->fromPost('mes', date('m')),
            'ano' => $this->params()->fromPost('ano', date('Y')),
            'categoria' => $this->params()->fromPost('categoria', 0),
            'usuario' => $this->params()->fromPost('usuario', $sessao->cod_usuario)
        );
        
        $admin = $sessao->tipo_usuario == 1 ? 1 : 0;
        $params['usuario'] = $admin ? $params['usuario'] : $sessao->cod_usuario;
        
        $sql = "select * from sys_meses order by mes asc";
        $meses = $funcoes->executarSQL($sql, []);
        
        $anos = [];
        for ($i = date('Y')-5 ; $i < date('Y') + 5; $i++) {
            array_push($anos, $i);
        }
        
        $sql = "select * from us_usuario where ativo = 1 order by nome";
        $membros = $funcoes->executarSQL($sql, $params);
        
        $sql = "select * from mts_categoria order by descricao";
        $categorias = $funcoes->executarSQL($sql, []);
        
        $sql = "select a.*, b.nome, date_format(a.data_criacao, '%d/%m/%Y') as data, c.descricao as categoria, CONCAT(a.mes,'/',a.ano) as data "
             . "from mts_metas a "
                . "inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario "
                . "inner join mts_categoria c on c.cod_categoria = a.categoria_fk "
             . "where a.mes = :mes and a.ano = :ano and (a.categoria_fk = :categoria or :categoria = 0) and a.cod_usuario_fk = :usuario order by a.data_criacao asc";
        $result = $funcoes->executarSQL($sql, $params);
        
        $view = new ViewModel(array(
            'meses' => $meses,
            'anos' => $anos,
            'mes' => $params['mes'],
            'ano' => $params['ano'],
            'categoria' => $params['categoria'],
            'usuario' => $params['usuario'],
            'admin' => $admin,
            'categorias' => $categorias,
            'membros' => $membros,
            'result' => $result
        ));

        $view->setTemplate('quadro/metas');
        return $view;
    }
    
    public function addAction() {

        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");

        $response = $this->getResponse();
        $request = $this->getRequest();

        if ($request->isPost()) {

            $post_data = $this->params()->fromPost();
            $post_data['usuario'] = $sessao->cod_usuario;
            
            $sql = "INSERT INTO mts_metas (descricao, mes, ano, status, categoria_fk, data_criacao, cod_usuario_fk) "
                    . "VALUES (:add_descricao,:add_mes,:add_ano,0,:add_categoria,now(),:usuario);";
            $funcoes->executarSQL($sql, $post_data);

            return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Meta Adicionada!')));
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
            
            $sql = "select * from mts_metas where cod_meta = :cod";
            $result = $funcoes->executarSQL($sql, $params, 'fetch');
            
            return $response->setContent(Json::encode(array('response' => true, 'result' => $result)));
        } else {
            header('Location: /eventos');
            exit;
        }
    }

    public function editAction() {
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");

        $response = $this->getResponse();
        $request = $this->getRequest();

        if ($request->isPost()) {
            $post_data = $this->params()->fromPost();
            
            $sql = "update mts_metas set descricao= :edit_descricao, mes = :edit_mes, ano = :edit_ano, categoria_fk = :edit_categoria where cod_meta = :edit_cod";
            $funcoes->executarSQL($sql, $post_data);

            return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Meta alterada com sucesso!')));
            
        } else {
            header('Location: /plano-metas');
            exit;
        }
    }
    
     public function deleteAction() {
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");

        $response = $this->getResponse();
        $request = $this->getRequest();

        if ($request->isPost()) {
            $post_data = $this->params()->fromPost();
            
            $sql = "delete from mts_metas where cod_meta = :cod";
            $funcoes->executarSQL($sql, $post_data);

            return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Meta excluída com sucesso!')));
            
        } else {
            header('Location: /plano-metas');
            exit;
        }
    }
    
    public function concluirAction() {
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");

        $response = $this->getResponse();
        $request = $this->getRequest();

        if ($request->isPost()) {
            $post_data = $this->params()->fromPost();
            $sql = "update mts_metas set status = :status where cod_meta = :cod";
            $funcoes->executarSQL($sql, $post_data);

            return $response->setContent(Json::encode(array('response' => true)));
            
        } else {
            header('Location: /plano-metas');
            exit;
        }
    }
}
