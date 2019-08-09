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
}
