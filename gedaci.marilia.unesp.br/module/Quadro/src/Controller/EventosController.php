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

class EventosController extends AbstractActionController {

    public function eventosAction() {

        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");

        $sql = "select * from sys_meses order by mes asc";
        $meses = $funcoes->executarSQL($sql, []);

        $sql = "select *, date_format(data_ini, '%d/%m/%Y') as inicio, date_format(data_fim, '%d/%m/%Y') as fim from evts_eventos";
        $eventos = $funcoes->executarSQL($sql, []);

        $anos = [];
        for ($i = date('Y'); $i < date('Y') + 5; $i++) {
            array_push($anos, $i);
        }

        $view = new ViewModel(array(
            'eventos' => $eventos,
            'meses' => $meses,
            'anos' => $anos,
            'mes' => date('m'),
            'dia' => date('d'),
            'ano' => date('Y')
        ));

        $view->setTemplate('quadro/eventos');
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
            $post_data['add_fim'] = $post_data['add_fim'] . ' 23:59:59';
            
            if(isset($post_data['add_insc_fim'])){
                $post_data['add_insc_fim'] = $post_data['add_insc_fim'] . ' 23:59:59';
            }
            
            $sql = "INSERT INTO evts_eventos (nome,data_ini,data_fim,local,site, data_criacao, cod_usuario_fk, data_insc_ini, data_insc_fim, qtd_autores) "
                    . "VALUES (:add_nome,:add_ini,:add_fim,:add_local,:add_site,now(),:usuario,:add_insc_ini,:add_insc_fim,:add_qtdautores);";
            $funcoes->executarSQL($sql, $post_data);

            return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Evento Adicionado!')));
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
            
            $sql = "select *, date_format(data_ini, '%Y-%m-%d') as inicio, date_format(data_fim, '%Y-%m-%d') as fim, "
                    . "date_format(data_insc_ini, '%Y-%m-%d') as insc_inicio, date_format(data_insc_fim, '%Y-%m-%d') as insc_fim, "
                    . "case cod_usuario_fk when :usuario then 1 else 0 end as edit "
                    . "from evts_eventos "
                    . "where cod_evento = :cod";
            $result = $funcoes->executarSQL($sql, $params, 'fetch');
            
            $sql = "select * from evts_evento_usuario where cod_evento_fk = :cod and cod_usuario_fk = :usuario";
            $present = $funcoes->executarSQL($sql, $params, 'fetch');
            
            $sql = "select b.nome, c.descricao from evts_evento_usuario a 
                	inner join us_usuario b on a.cod_usuario_fk = b.cod_usuario 
                        inner join nivel_escolaridade c on c.cod_nivel=b.nivel_escolaridade_fk where a.cod_evento_fk = :cod";
            $presentes = $funcoes->executarSQL($sql, $params);
            
            $html = "";
            
            if($presentes){
                foreach($presentes as $dados){
                    $html .= '<tr role="row" class="odd">'
                            . '<td width="8%" class="text-left " bgcolor="#FFFFFF"><font color="#000000">'.$dados['nome'].'</font></td>
                              <td width="4%" class="text-center" bgcolor="#FFFFFF"><font color="#000000">'.$dados['descricao'].'</font></td></tr>';
                }
            }else{
                $html .= '<tr role="row" class="odd">'
                            . '<td width="8%" class="text-center" colspan="2" bgcolor="#FFFFFF"><font color="#000000">Nenhuma presença confirmada!</font></td></tr>';
            }
            
            $result['present'] = isset($present) ? 1 : 0;
            $result['valor'] = number_format($result['valor'], 2, ',', '.');

            return $response->setContent(Json::encode(array('response' => true, 'result' => $result, 'html' => $html)));
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
            $post_data['edit_fim'] = $post_data['edit_fim'] . ' 23:59:59';
            
            if(isset($post_data['edit_insc_fim'])){
                $post_data['edit_insc_fim'] = $post_data['edit_insc_fim'] . ' 23:59:59';
            }
            
            $sql = "update evts_eventos set nome=:edit_nome, data_ini=:edit_ini, data_fim=:edit_fim, local=:edit_local, site=:edit_site, data_insc_ini =:edit_insc_ini, data_insc_fim =:edit_insc_fim, qtd_autores =:edit_qtdautores where cod_evento = :edit_cod";
            $funcoes->executarSQL($sql, $post_data);

            return $response->setContent(Json::encode(array('response' => true, 'msg' => 'Evento alterado com sucesso!')));
            
        } else {
            header('Location: /eventos');
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
            $sql = "delete from evts_eventos where cod_evento = :cod";
            $funcoes->executarSQL($sql, $post_data);

            return $response->setContent(Json::encode(array('response' => true)));
            
        } else {
            header('Location: /eventos');
            exit;
        }
    }
    
    public function presentAction() {
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");

        $response = $this->getResponse();
        $request = $this->getRequest();

        if ($request->isPost()) {
            $post_data = $this->params()->fromPost();
            $post_data['usuario'] = $sessao->cod_usuario;
            
            if($post_data['aux']){
                $sql = "insert into evts_evento_usuario (cod_usuario_fk, cod_evento_fk) values (:usuario, :cod)";
                $funcoes->executarSQL($sql, $post_data);

                return $response->setContent(Json::encode(array('response' => true)));
            }else{
                $sql = "delete from evts_evento_usuario where cod_usuario_fk = :usuario and cod_evento_fk = :cod";
                $funcoes->executarSQL($sql, $post_data);

                return $response->setContent(Json::encode(array('response' => true)));
            }
        } else {
            header('Location: /eventos');
            exit;
        }
    }


}
