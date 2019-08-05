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

class QuadroDisponibilidadeController extends AbstractActionController
{
    public function quadroDisponibilidadeAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $params = array(
            'user' => $sessao->cod_usuario
        );
        
        $sql = "select * from sys_meses order by mes asc";
        $meses = $funcoes->executarSQL($sql, $params);
        
        $sql = "select * from disp_quadro_disponibilidade_color where cod_usuario=:user";
        $color = $funcoes->executarSQL($sql, $params, '');
        
        $sql = "call us_BuscarDisponibilidades_sp (:user)";
        $disponibilidades = $funcoes->executarSQL($sql, $params);
        
        $sql = "call us_BuscarDisponibilidadesSemanas_sp (:user)";
        $semanas = $funcoes->executarSQL($sql, $params);
        
        $anos = [];
        for($i = date('Y')-5; $i < date('Y')+5; $i++){
            array_push($anos, $i);
        }
        
        $view = new ViewModel(array(
            'disponibilidades'  => $disponibilidades,
            'semanas'           => $semanas,
            'meses'             => $meses,
            'anos'              => $anos,
            'color'             => $color,
            'mes'               => date('m'),
            'dia'               => date('d'),
            'ano'               => date('Y')
        ));
        
        $view->setTemplate('quadro/quadro-disponibilidade');
        return $view;
    }
    
    public function addAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $response = $this->getResponse();
        
        $tipo = $this->params()->fromPost('tipo','-1');
        
        if($tipo == 1){
            
            $params = array(
                'user'  => $sessao->cod_usuario,
                'tipo'  => $tipo, 
                'date'  => $this->params()->fromPost('dt'),
                'hrini' => $this->params()->fromPost('hrini'),
                'hrfim' => $this->params()->fromPost('hrfim'),
            );
            
            $params['dtini'] = $params['date'];
            $params['dtfim'] = $params['date'];
            
            $sql = "insert into disp_quadro_disponibilidade (cod_usuario_fk,data_criacao,dataini,datafim,horaini,horafim,tipo) values (:user,now(),:dtini,:dtfim,:hrini,:hrfim,:tipo)";
            $funcoes->executarSQL($sql,$params);
        }
        
        if($tipo == 2){
            
            $params = array(
                'user'  => $sessao->cod_usuario,
                'tipo'  => $tipo, 
                'dtini' => $this->params()->fromPost('dtini', ''),
                'dtfim' => $this->params()->fromPost('dtfim', ''),
                'hrini' => $this->params()->fromPost('hrini', ''),
                'hrfim' => $this->params()->fromPost('hrfim', ''),
            );
            
            $params['date'] = $params['dtini'];
            while (strtotime($params['date']) <= strtotime($params['dtfim'])) {
                
                $sql = "insert into disp_quadro_disponibilidade (cod_usuario_fk,data_criacao,dataini,datafim,horaini,horafim,tipo) values (:user,now(),:date,:date,:hrini,:hrfim,:tipo)";
                $funcoes->executarSQL($sql,$params);
                
                $params['date'] = date ("Y-m-d", strtotime("+1 day", strtotime($params['date'])));
            }
            
        }
        
        if($tipo == 3){
            $params = array(
                'user'      => $sessao->cod_usuario,
                'tipo'      => $tipo, 
            );
            
            $semanas = $this->params()->fromPost('semanas');
            
            $sql = "insert into disp_quadro_disponibilidade_semanas (cod_usuario_fk, domingo_1_ini, domingo_1_fim, domingo_2_ini, domingo_2_fim, segunda_1_ini, segunda_1_fim, segunda_2_ini, segunda_2_fim, terca_1_ini, terca_1_fim, terca_2_ini, terca_2_fim, quarta_1_ini, quarta_1_fim, quarta_2_ini,quarta_2_fim, quinta_1_ini, quinta_1_fim, quinta_2_ini, quinta_2_fim, sexta_1_ini, sexta_1_fim, sexta_2_ini, sexta_2_fim, sabado_1_ini, sabado_1_fim, sabado_2_ini, sabado_2_fim, data_movimento)"
                    . " values (:user, :domingo_1_ini, :domingo_1_fim, :domingo_2_ini, :domingo_2_fim, :segunda_1_ini, :segunda_1_fim, :segunda_2_ini, :segunda_2_fim, :terca_1_ini, :terca_1_fim, :terca_2_ini, :terca_2_fim, :quarta_1_ini, :quarta_1_fim, :quarta_2_ini, :quarta_2_fim, :quinta_1_ini, :quinta_1_fim, :quinta_2_ini, :quinta_2_fim, :sexta_1_ini, :sexta_1_fim, :sexta_2_ini, :sexta_2_fim, :sabado_1_ini, :sabado_1_fim, :sabado_2_ini, :sabado_2_fim , now())"; 
            foreach($semanas as $semana){
                if($semana['checked'] == 'true'){
                    if($semana['semana'] == '1'){
                        $params['domingo_1_ini'] = $semana['periodo1_ini'];
                        $params['domingo_1_fim'] = $semana['periodo1_fim'];
                        $params['domingo_2_ini'] = !empty($semana['periodo2_ini']) ? $semana['periodo2_ini'] : null;
                        $params['domingo_2_fim'] = !empty($semana['periodo2_fim']) ? $semana['periodo2_fim'] : null;
                    }
                    
                    if($semana['semana'] == '2'){
                        $params['segunda_1_fim'] = $semana['periodo1_ini'];
                        $params['segunda_1_ini'] = $semana['periodo1_fim'];
                        $params['segunda_2_ini'] = !empty($semana['periodo2_ini']) ? $semana['periodo2_ini'] : null;
                        $params['segunda_2_fim'] = !empty($semana['periodo2_fim']) ? $semana['periodo2_fim'] : null;
                    }
                    
                    if($semana['semana'] == '3'){
                        $params['terca_1_ini'] = $semana['periodo1_ini'];
                        $params['terca_1_fim'] = $semana['periodo1_fim'];
                        $params['terca_2_ini'] = !empty($semana['periodo2_ini']) ? $semana['periodo2_ini'] : null;
                        $params['terca_2_fim'] = !empty($semana['periodo2_fim']) ? $semana['periodo2_fim'] : null;
                    }
                    
                    if($semana['semana'] == '4'){
                        $params['quarta_1_ini'] = $semana['periodo1_ini'];
                        $params['quarta_1_fim'] = $semana['periodo1_fim'];
                        $params['quarta_2_ini'] = !empty($semana['periodo2_ini']) ? $semana['periodo2_ini'] : null;
                        $params['quarta_2_fim'] = !empty($semana['periodo2_fim']) ? $semana['periodo2_fim'] : null;
                    }
                    
                    if($semana['semana'] == '5'){
                        $params['quinta_1_ini'] = $semana['periodo1_ini'];
                        $params['quinta_1_fim'] = $semana['periodo1_fim'];
                        $params['quinta_2_ini'] = !empty($semana['periodo2_ini']) ? $semana['periodo2_ini'] : null;
                        $params['quinta_2_fim'] = !empty($semana['periodo2_fim']) ? $semana['periodo2_fim'] : null;
                    }
                    
                    if($semana['semana'] == '6'){
                        $params['sexta_1_ini'] = $semana['periodo1_ini'];
                        $params['sexta_1_fim'] = $semana['periodo1_fim'];
                        $params['sexta_2_ini'] = !empty($semana['periodo2_ini']) ? $semana['periodo2_ini'] : null;
                        $params['sexta_2_fim'] = !empty($semana['periodo2_fim']) ? $semana['periodo2_fim'] : null;
                    }
                    
                    if($semana['semana'] == '7'){
                        $params['sabado_1_ini'] = $semana['periodo1_ini'];
                        $params['sabado_1_fim'] = $semana['periodo1_fim'];
                        $params['sabado_2_ini'] = !empty($semana['periodo2_ini']) ? $semana['periodo2_ini'] : null;
                        $params['sabado_2_fim'] = !empty($semana['periodo2_fim']) ? $semana['periodo2_fim'] : null;
                    }
                }else{
                    if($semana['semana'] == '1'){
                        $params['domingo_1_ini'] = null;
                        $params['domingo_1_fim'] = null;
                        $params['domingo_2_ini'] = null;
                        $params['domingo_2_fim'] = null;
                    }
                    
                    if($semana['semana'] == '2'){
                        $params['segunda_1_fim'] = null;
                        $params['segunda_1_ini'] = null;
                        $params['segunda_2_ini'] = null;
                        $params['segunda_2_fim'] = null;
                    }
                    
                    if($semana['semana'] == '3'){
                        $params['terca_1_ini'] = null;
                        $params['terca_1_fim'] = null;
                        $params['terca_2_ini'] = null;
                        $params['terca_2_fim'] = null;
                    }
                    
                    if($semana['semana'] == '4'){
                        $params['quarta_1_ini'] = null;
                        $params['quarta_1_fim'] = null;
                        $params['quarta_2_ini'] = null;
                        $params['quarta_2_fim'] = null;
                    }
                    
                    if($semana['semana'] == '5'){
                        $params['quinta_1_ini'] = null;
                        $params['quinta_1_fim'] = null;
                        $params['quinta_2_ini'] = null;
                        $params['quinta_2_fim'] = null;
                    }
                    
                    if($semana['semana'] == '6'){
                        $params['sexta_1_ini'] = null;
                        $params['sexta_1_fim'] = null;
                        $params['sexta_2_ini'] = null;
                        $params['sexta_2_fim'] = null;
                    }
                    
                    if($semana['semana'] == '7'){
                        $params['sabado_1_ini'] = null;
                        $params['sabado_1_fim'] = null;
                        $params['sabado_2_ini'] = null;
                        $params['sabado_2_fim'] = null;
                    }
                }
            }
            $funcoes->executarSQL($sql,$params);
        }
        
        return $response->setContent(Json::encode(array('response' => true)));
    }
    
    public function editColorAction(){
        $funcoes = new Funcoes($this);
        $sessao = new Container("usuario");
        
        $response = $this->getResponse();
        
        $params = array(
            'user' => $sessao->cod_usuario,
            'cor'  => $this->params()->fromPost('color', '#629bad')
        );
        
        $sql = "update disp_quadro_disponibilidade_color set color=:cor where cod_usuario =:user";
        $funcoes->executarSQL($sql,$params);
        
        return $response->setContent(Json::encode(array('response' => true)));
    }
}
