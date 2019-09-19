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
        $view = new ViewModel();
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
        
        $arvore = $this->gerarArvore($result);
        
        $sql = "select cod_questionario,a.descricao as titulo from qst_questionario a
                where a.cod_questionario = :questionario";
        $titulo = $funcoes->executarSQL($sql,$params,'');
        
        return $response->setContent(Json::encode(array('response' => true, 'titulo' => $titulo['titulo'], 'cod_questionario' => $titulo['cod_questionario'],'html' => $this->gerarArvore($result))));
    }
    
    public function addQuestaoAction(){
        $funcoes = new Funcoes($this);
        
        $response = $this->getResponse();
        
        $params = array(
            'questionario'              => $this->params()->fromPost('cod_questionario', ''),
            'cod_questao'               => $this->params()->fromPost('cod_dependencia', '0'),
            'desc_questao'              => $this->params()->fromPost('desc_questao', ''),
            
            'tipo_questao'              => $this->params()->fromPost('tipo_questao', '')
        );
        
        //inserir questao
        $sql = "insert into qst_questao1 (cod_questionario,desc_pergunta,tipo_pergunta,is_sub,data_criacao) values(:questionario,:desc_questao,:tipo_questao, 0, now())";
        $funcoes->executarSQL($sql, $params);
        
        $sql = "select max(cod) as cod_questao from qst_questao1";
        $params['dependencia'] = $funcoes->executarSQL($sql, [], '')['cod_questao'];
        
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
        
        $sql = "call us_buscarQuestionarios_sp (:questionario)";
        $result = $funcoes->executarSQL($sql, array('questionario' => $params['questionario']));
        
        $arvore = $this->gerarArvore($result);
        
        return $response->setContent(Json::encode(array('response' => true, 'html' => $this->gerarArvore($result))));
    }
    
    public function gerarArvore($datas, $parent = 0, $depth = 0){
        $ni=count($datas);
        if($ni === 0 || $depth > 100) return '';
        $tree = '<div class="list-group">';
        for($i=0; $i < $ni; $i++){
            if($datas[$i]['parent'] == $parent){
                $tree .= '<a href="#" class="list-group-item" onClick="editQuestao('.$datas[$i]['id'].')">'.  
                            str_repeat('-', $depth) . ' ' .
                            $datas[$i]['name'] .
                          '</a>';
                $tree .= $this->gerarArvore($datas, $datas[$i]['id'], $depth+1);
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
