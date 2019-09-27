<?php
/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Questionario\Controller;

use Application\Classes\Funcoes;
use Application\Classes\Relatorio;
use Zend\Json\Json;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Session\Container;
use Zend\View\Model\ViewModel;

class QuestionarioController extends AbstractActionController
{
    
    public function questionarioAction(){
        echo "<pre>";
        var_dump('asda');
        echo "</pre>";
        exit;
    }
    
    public function inicialAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $params = array(
            'cod_questao'   => $this->params()->fromRoute('cod_questao',0)
        );
        
        $questao = [];
        
        $sql = 'select a.cod_questionario, a.descricao, a.status_questionario,date_format(a.data_criacao, "%d/%m/%Y %H:%i:%s") as data_criacao '.
                'from qst_questionario a where status_questionario = 1';
        $questionario = $funcoes->executarSQL($sql, [], '');
        
        if($params['cod_questao'] != 0){
            $sql = 'select desc_pergunta,tipo_pergunta from qst_questao1 where cod = :cod_questao';
            $questao = $funcoes->executarSQL($sql, $params, '');
            
            $sql = 'select b.cod, b.desc_pergunta
                    from qst_questionario a
                            inner join qst_questao1 b on a.cod_questionario = b.cod_questionario
                            inner join qst_questao_dependencia c on c.cod_questao_dependente = b.cod
                    where a.cod_questionario = :questionario and c.cod_questao = :cod_questao order by b.cod asc;';
            $questao['alternativas'] = $funcoes->executarSQL($sql, array(
                'questionario'  => $questionario['cod_questionario'],
                'cod_questao'   => $params['cod_questao']
            ));
        }else{
            
        }
        
        $view = new ViewModel(array(
            'questionario'  => $questionario,
            'questao'       => $questao,
            'voltar'        => 0,
            'proximo'       => 1
        ));
        
        $view->setTemplate('questionario/questionario-inicial');
        return $view;
    }
    
    public function cadastroAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        $relatorio = new Relatorio();
        
        $params = array(
            'usuario'   => $sessao->cod_usuario
        );
        
        $sql = "call us_buscarQuestionarios_sp (0)";
        $questionarios = $funcoes->executarSQL($sql, $params);
        
        $relatorio->definirColuna('CODIGO', 'cod_questionario', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('DESCRIÇÃO', 'descricao', '10', 'left', 't', 'n', 'n');
        $relatorio->definirColuna('CRIADO POR', 'nome', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('DATA', 'data_criacao', '4', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('INATIVAR / ATIVAR', '1', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('EDITAR', '2', '2', 'center', 't', 'n', 'n');
        $relatorio->definirColuna('EXCLUIR', '3', '2', 'center', 't', 'n', 'n');
        
        $view = new ViewModel(array(
            'relatorio'     => $relatorio,
            'questionarios' => $questionarios,
        ));
        
        $view->setTemplate('questionario/questionario-cadastro');
        return $view;
    }
    
    public function novoQuestionarioAction(){
        $funcoes = new Funcoes($this);
        
        $response = $this->getResponse();
        
        $params = array(
            'questionario'  => $this->params()->fromPost('questionario_desc', '')
        );
        
        echo "<pre>";
        var_dump($params);
        echo "</pre>";
        exit;
    }
    
    public function buscarQuestionarioAction(){
        $funcoes = new Funcoes($this);
        
        $response = $this->getResponse();
        
        $params = array(
            'questionario'  => $this->params()->fromPost('questionario', 1)
        );
        
        $sql = "call us_buscarQuestionarios_sp (:questionario)";
        $result = $funcoes->executarSQL($sql, $params);
        
        $arvore = $this->gerarArvore($result, 0, 0, $params['questionario'], 1);
        
        $sql = "select cod_questionario,a.descricao as titulo from qst_questionario a
                where a.cod_questionario = :questionario";
        $titulo = $funcoes->executarSQL($sql,$params,'');
        
        return $response->setContent(Json::encode(array('response' => true, 'titulo' => $titulo['titulo'], 'cod_questionario' => $titulo['cod_questionario'],'html' => $arvore)));
    }
    
    public function buscarQuestaoAction(){
        $funcoes = new Funcoes($this);
        
        $response = $this->getResponse();
        
        $params = array(
            'questionario'  => $this->params()->fromPost('questionario', 1),
            'qstao'         => $this->params()->fromPost('questao', 1),
            'tipo'          => $this->params()->fromPost('tipo', 0),
        );
        
        if($params['tipo'] == '0'){
            //pegar a questao e o tipo dela
            $sql = "select b.cod, b.desc_pergunta, tipo_pergunta, b.dependencia_questao, b.dependencia_alternativa
                    from qst_questionario a
                        inner join qst_questao1 b on a.cod_questionario = b.cod_questionario
                    where a.cod_questionario =:questionario and b.cod = :qstao order by b.cod asc;";
            $questao = $funcoes->executarSQL($sql, $params, '');

            //pegar as alternativas dela 
            $sql = "select b.desc_pergunta, b.cod
                    from qst_questionario a
                        inner join qst_questao1 b on a.cod_questionario = b.cod_questionario
                        inner join qst_questao_dependencia c on c.cod_questao_dependente = b.cod
                    where a.cod_questionario = :questionario and c.cod_questao = :qstao order by b.cod asc;";
            $alternativas = $funcoes->executarSQL($sql, $params);
            return $response->setContent(Json::encode(array('response' => true, 'alternativas' => $alternativas, 'questao' => $questao)));
        }else if($params['tipo'] == '1'){
            $sql = "select b.cod, b.desc_pergunta, tipo_pergunta
                    from qst_questionario a
                        inner join qst_questao1 b on a.cod_questionario = b.cod_questionario
                    where a.cod_questionario =:questionario and (b.cod <> :qstao or :qstao = 0) and is_sub = 0 order by b.cod asc;";
            $questao = $funcoes->executarSQL($sql, $params);
            return $response->setContent(Json::encode(array('response' => true, 'questao' => $questao)));
        }else{
            $sql = "select b.cod, b.desc_pergunta
                    from qst_questionario a
                        inner join qst_questao1 b on a.cod_questionario = b.cod_questionario
                        inner join qst_questao_dependencia c on c.cod_questao_dependente = b.cod
                    where a.cod_questionario = :questionario and c.cod_questao = :qstao order by b.cod asc;";
            $alternativas = $funcoes->executarSQL($sql, $params);
            return $response->setContent(Json::encode(array('response' => true, 'alternativas' => $alternativas)));
        }
    }
    
    public function addQuestaoAction(){
        $funcoes = new Funcoes($this);
        
        $response = $this->getResponse();
        
        $params = array(
            'questionario'              => $this->params()->fromPost('cod_questionario', ''),
            'cod_questao'               => $this->params()->fromPost('cod_dependencia', '0'),
            'desc_questao'              => $this->params()->fromPost('desc_questao', ''),
            'tipo_questao'              => $this->params()->fromPost('tipo_questao', ''),
            'dep_questao'               => $this->params()->fromPost('dependencia_questao', '0'),
            'dep_alternativa'           => $this->params()->fromPost('dependencia_alternativa', '0'),
        );
        
        //inserir questao
        $sql = "insert into qst_questao1 (cod_questionario, desc_pergunta, tipo_pergunta, is_sub,dependencia_questao, dependencia_alternativa, data_criacao)"
                               . " values(:questionario, :desc_questao, :tipo_questao, 0, :dep_questao, :dep_alternativa, now())";
        $funcoes->executarSQL($sql, $params);
        
        $sql = "select max(cod) as cod_questao from qst_questao1";
        $params['dependencia'] = $funcoes->executarSQL($sql, [], '')['cod_questao'];
        
        if($params['dep_questao'] != 0){
            $sql = "insert into qst_questao_dependencia(cod_questao_dependente,cod_questao) values(:dependencia,:cod_questao)";
            $funcoes->executarSQL($sql, array(
                'dependencia'   => $params['dependencia'],
                'cod_questao'   => $params['dep_alternativa']
            ));   
        }
        
        if($params['tipo_questao'] == '1') {
        
            $sql = "insert into qst_questao_dependencia(cod_questao_dependente,cod_questao) values(:dependencia,:cod_questao)";
            $funcoes->executarSQL($sql, $params);

            $params['alternativas'] = $this->params()->fromPost('alternativas', '');

            //inserir alternativas
            foreach($params['alternativas'] as $alternativa){

                $params2 = array(
                    'desc_questao' => $alternativa,
                    'questionario' => $params['questionario'],
                    'cod_questao' => $params['dependencia'],
                );

                $sql = "insert into qst_questao1 (cod_questionario,desc_pergunta,tipo_pergunta,is_sub,data_criacao) values(:questionario,:desc_questao,0,1,now())";
                $funcoes->executarSQL($sql, $params2); 

                $sql = "select max(cod) as cod_questao from qst_questao1";
                $params2['dependencia'] = $funcoes->executarSQL($sql, [], '')['cod_questao'];

                $sql = "insert into qst_questao_dependencia(cod_questao_dependente,cod_questao) values(:dependencia,:cod_questao)";
                $funcoes->executarSQL($sql, $params2);
            }
        }
        
        $sql = "call us_buscarQuestionarios_sp (:questionario)";
        $result = $funcoes->executarSQL($sql, array('questionario' => $params['questionario']));
        
        $arvore = $this->gerarArvore($result, 0, 0, $params['questionario'], 1);
        
        return $response->setContent(Json::encode(array('response' => true, 'html' => $arvore)));
    }
    
    public function editQuestaoAction(){
        $funcoes = new Funcoes($this);
        
        $response = $this->getResponse();
        
        $params = array(
            'questionario'              => $this->params()->fromPost('cod_questionario', ''),
            'cod_questao'               => $this->params()->fromPost('cod_questao', '0'),
            'desc_questao'              => $this->params()->fromPost('desc_questao', ''),
            'tipo_questao'              => $this->params()->fromPost('tipo_questao', ''),
            'dep_questao'               => $this->params()->fromPost('dependencia_questao', '0'),
            'dep_alternativa'           => $this->params()->fromPost('dependencia_alternativa', '0'),
        );
        
        //update questao
        $sql = "update qst_questao1 set desc_pergunta =:desc_questao, dependencia_questao =:dep_questao, dependencia_alternativa =:dep_alternativa where cod =:cod_questao";
        $funcoes->executarSQL($sql, $params);
        
        //deletar dependencia
        $sql = "delete from qst_questao_dependencia where cod_questao_dependente =:cod_questao";
        $funcoes->executarSQL($sql, $params);
        
        //adicionar dependencia
        if($params['dep_questao'] != 0){
            $sql = "insert into qst_questao_dependencia(cod_questao_dependente,cod_questao) values(:dependencia,:cod_questao)";
            $funcoes->executarSQL($sql, array(
                'dependencia'   => $params['cod_questao'],
                'cod_questao'   => $params['dep_alternativa']
            ));   
        }
        
        if($params['tipo_questao'] == '1') {
            
            $ArrAlternativas = $this->params()->fromPost('alternativas','');
            
            //deletar todoas as alternativas e inserir novamente
            if(empty($ArrAlternativas['existe'])){
                $sql = "delete from qst_questao_dependencia where cod_questao =:cod_questao";
                $funcoes->executarSQL($sql,$params);
            }else{
                foreach($ArrAlternativas['existe'] as $dados){
                    $sql = "update qst_questao1 set desc_pergunta=:pergunta where cod =:cod";
                    $funcoes->executarSQL($sql, array(
                        'pergunta'  => explode('|', $dados)['0'],
                        'cod'       => explode('|', $dados)['1'],
                    ));
                }
            }
            
            if(!empty($ArrAlternativas['nexiste'])){
            //inserir alternativas
                foreach($ArrAlternativas['nexiste'] as $alternativa){

                    $params2 = array(
                        'desc_questao' => $alternativa,
                        'questionario' => $params['questionario'],
                        'cod_questao'  => $params['cod_questao']
                    );

                    $sql = "insert into qst_questao1 (cod_questionario,desc_pergunta,tipo_pergunta,is_sub,data_criacao) values(:questionario,:desc_questao,0,1,now())";
                    $funcoes->executarSQL($sql, $params2); 

                    $sql = "select max(cod) as cod_questao from qst_questao1";
                    $params2['dependencia'] = $funcoes->executarSQL($sql, [], '')['cod_questao'];

                    $sql = "insert into qst_questao_dependencia(cod_questao_dependente,cod_questao) values(:dependencia,:cod_questao)";
                    $funcoes->executarSQL($sql, $params2);
                }
            }
        }
        
        $sql = "call us_buscarQuestionarios_sp (:questionario)";
        $result = $funcoes->executarSQL($sql, array('questionario' => $params['questionario']));
        
        $arvore = $this->gerarArvore($result, 0, 0, $params['questionario'], 1);
        
        return $response->setContent(Json::encode(array('response' => true, 'html' => $arvore)));
    }
    
    public function gerarArvore($datas, $parent = 0, $depth = 0, $questionario = 0, $contador = 0){
        $ni=count($datas);
        if($ni === 0 || $depth > 100) return '';
        $tree = '<div class="list-group">';
        for($i=0; $i < $ni; $i++){
            if($datas[$i]['parent'] == $parent){
                $tree .= '<a href="#" class="list-group-item '.($datas[$i]['dependencia_questao'] != 0 ? "bd-left" : "").'" onClick="editQuestao('.$datas[$i]['id'].','.$questionario.')">'.  
                            ($datas[$i]['dependencia_questao'] != 0 ? " " : ($contador) . ') ').   
                            $datas[$i]['name'] .
                         '</a>';
                if($datas[$i]['dependencia_questao'] == 0){
                    $contador = $contador + 1;
                }
                $tree .= $this->gerarArvore($datas, $datas[$i]['id'], $depth+1, $questionario, $contador);
            }
        }
        $tree .= '</div>';
        return $tree;
    }
    
    
    //<div class="list-group">
    //    <a href="#" class="list-group-item">
    //        1) Você já recebeu algum tipo de bolsa?
    //    </a>
    //    <div class="list-group">
    //        <a href="#" class="list-group-item">1.1) Sim</a>
    //        <div class="list-group">
    //            <a href="#" class="list-group-item">1.1.1) De qual tipo?</a>
    //            <a href="#" class="list-group-item">1.1.2) Durante qual período?</a>
    //            <a href="#" class="list-group-item">1.1.3) Quem foi o orientador (nome completo)?</a>
    //        </div>
    //        <a href="#" class="list-group-item">1.2) Não</a>
    //    </div>
    //</div>
}
