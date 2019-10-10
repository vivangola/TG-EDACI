<?php

namespace Application\Classes;

use Exception;
use mysqli;
use Zend\Session\Container;

class Funcoes {
    protected $em;
    protected $objeto;
    protected $tradutor;

    public function __construct($objeto = null) {
        $this->objeto = $objeto;
        /*
        if ($this->objeto != null) {
            $this->tradutor = $this->objeto->getServiceLocator()->get('translator');
        }
         */
        
    }

    protected function getEntityManager($connector = "orm_default") {
        //if ($this->em === null) {
        $this->em = $this->objeto->getServiceLocator()->get('doctrine.entitymanager.' . $connector);
        //}                
//        echo "LOG:<br>";
//        $this->em->getConnection()
//        ->getConfiguration()
//        ->setSQLLogger(new \Doctrine\DBAL\Logging\EchoSQLLogger());

//        echo "<br><br>_____________________<br>";                    
        return $this->em;
    }
    
    public function getParametros() {
        return (array) $this->objeto->getServiceLocator()->get('config')['configuracao_loja'];
    }

    public function moneyFormat($floatcurr, $curr = 'pt_BR') {
        $curr = 'pt_BR';
        // custom function to generate: ##,##,###.##
        $currencies[strtolower('pt_BR')] = array(2, ',', '.', 'R$'); //Brazilian Real
        $currencies[strtolower('fr_CA')] = array(2, '.', ',', '$'); //Canadian Dollar
        $currencies[strtolower('es_ES')] = array(2, '.', ',', '$'); //Peso Mexicano
        $currencies[strtolower('en_US')] = array(2, '.', ',', '$'); //US Dollar       
        if ($curr == '') {
            return $this->formatarVirgulas($floatcurr);
        } else {
            return $currencies[strtolower($curr)][3] . '&nbsp;' . number_format($floatcurr, $currencies[strtolower($curr)][0], $currencies[strtolower($curr)][1], $currencies[strtolower($curr)][2]);
        }
    }
    
    public function executarSQL($sql = '', $params = array(), $tipo = 'all') {
        try{
            $dados = array(
                'server'    => 'localhost',
                'username'  => 'root',
                'password'  => '',
                'db'        => 'edaci'
            );

            $conn = new mysqli($dados['server'], $dados['username'], $dados['password'], $dados['db']);
            
            if ($conn->connect_error) {
                throw new Exception($conn->connect_error);
            }
            
            foreach($params as $key => $param){
                if(is_null($param)){
                    $sql = str_replace(':'.$key, "null", $sql);
                }else{
                    $sql = str_replace(':'.$key, "'".$param."'", $sql);
                }
            }
            
            $conn->query('SET NAMES utf8mb4');
            $result = $conn->query($sql);
            
            if(!$result){
                throw new Exception($conn->error);
            }
            
            $retorno = [];
            
            if(is_object($result)){
                if($tipo == 'all'){
                    while($row = $result->fetch_assoc()){
                        array_push($retorno, $row);
                    }
                }else{
                    $retorno = $result->fetch_assoc();
                }
            }
            
            if(is_array($result)){
                $retorno = $this->utf8_converter($retorno, 'all', 'decode');
            }
            
            $conn->close();
            return $retorno;
        } catch(Exception $e){
            throw new Exception("Erro no Banco de Dados SQL:\n\n".$sql."\n\n" . $e->getMessage());
        }
    }
    
    public function sqlBlinded($sql = '', $params = array()) {
            
        foreach($params as $key => $param){
            if(is_null($param)){
                $sql = str_replace(':'.$key, "null", $sql);
            }else{
                $sql = str_replace(':'.$key, "'".$param."'", $sql);
            }
        }
            
        return $sql;
    }
    
    function utf8_converter($array = array(), $opcao = 'all', $tipo = 'encode') {
        $array2 = array();
        if ($opcao == 'all') {
            foreach ($array as $row) {
                foreach ($row as $key => $value) {
                    $row[strtolower($key)] = utf8_encode($value);
//                    CASO O VALOR FIQUE COM CARACTERES DESCONHECIDOS DESCOMENTE
//                    $row[$key] = utf8_encode($value);
                }
                $array2[] = $row;
            }
        } else {
            if ($array) {
                foreach ($array as $key => $value) {
                    if ($tipo == 'encode') {
                        $array2[strtolower($key)] = utf8_encode($value);
                    } else {
                        if(!is_array($value)){
                            $array2[strtolower($key)] = utf8_decode($value);    
                        }                        
                    }
                }
            }
        }
        return $array2;
    }
    
    public function alertBasic($message = 'Access Denied', $close = false, $redirect = false, $type = 'warning', $titulo = 'AtenÃ§Ã£o!') {
        //$service_translate = $this->getTranslate();
        //$titulo =  $service_translate && $titulo ? $service_translate->translate($titulo) : $titulo;
        echo "<script src=\"/js/sweetalert.min.js\"></script>";
        echo "<link rel=\"stylesheet\" type=\"text/css\" href=\"/css/sweetalert.css\">";
        echo "<body><script>Swal.fire({title:'$titulo',text:'$message', type:'$type'}).then((result) => {" . ($close ? "window.close(); " : ($redirect ? "location.href='$redirect'": 'history.back()')) ."});</script></body>";
        exit;
    }
    
    public function getSQLBinded($sql,$params) {        
        $indexed=$params==array_values($params);                
        foreach($params as $k=>$v) {
            if(!is_array($v)){
                $k = strtolower($k);
                if(is_string($v)) $v="'$v'";            
                if($indexed) $sql=preg_replace('/\?/',$v,$sql,1);
                else $sql = preg_replace("/:$k\b/i", $v, $sql);
            }
        }
        return $sql;
    }
    
    public function verificaSessao(){
        $sessao = new Container('usuario');
        
        if(!$sessao->cod_usuario){
            return false;
        }else{
            return true;
        }
        
    }
    
    public function paginacao($posts){
        $pagina = isset($_GET['pagina']) ? $_GET['pagina'] : 1; 
        
        $numPag = 0;
        $artigosFinal = [];
        $artigos = [];
        
        for($i = 0; $i < count($posts); $i++){
            if($i % 5 == 0 && $i != 0){
                $numPag = $numPag == 0 ? 1 : $numPag;
                $artigosFinal[$numPag] = $artigos;
                $artigos = [];
                $numPag += 1;
            }
            $artigos[] = $posts[$i];
        }
        
        $numPag = $numPag == 0 ? 1 : $numPag;
        $artigosFinal[$numPag] = $artigos;
        
        if(count($artigos) > 0){
            $artigosFinal[$numPag] = $artigos;
        }else{
            $numPag = 0;
        }
        
        return array('numPag' => $numPag,'posts' => isset($artigosFinal[$pagina]) ? $artigosFinal[$pagina] : [],'footer' => $this->paginacaoFooter($numPag, $pagina));
    }
    
    public function paginacaoFooter($numPag,$pagAtual){
        $footer = [];
        $right = 0;
        
        $footerStr = "<ul class='pagination justify-content-center'>";
        
        for($i = 1; $i <= $numPag; $i++){
            
            //primeira parte mostrar em qual pagina o usuario estÃ¡
            if($pagAtual == $i){
                $class = "active";
            }else{
                $class = "";
            }
            
            if($i == 1){
                if($i + 3 == $pagAtual){
                    $footer[$i] = "<li class='page-item'><a class='page-link' href='/' tabindex='-1'><i class='fa fa-chevron-left'></i></a></li>";
                }else{
                    $footer[$i] = "<li class='page-item ".$class."'><a class='page-link' href='/'>".$i."</a></li>";
                }
            }else{
                if($numPag != 5){
                    if($i + 3 == $pagAtual){
                        $footer[$i] = "<li class='page-item'><a class='page-link' href='/' tabindex='-1'><i class='fa fa-chevron-left'></i></a></li>";
                        for($cont = $i-1; $cont > 0; $cont --){
                            unset($footer[$cont]);
                        }
                    }elseif($i - 3 == $pagAtual){
                        $footer[$i] = "<li class='page-item'><a class='page-link' href='/?pagina=".$numPag."' tabindex='-1'><i class='fa fa-chevron-right'></i></a></li>";
                        $right = 1;
                    }else{
                        if($right == 0){
                            $footer[$i] = "<li class='page-item ".$class."'><a class='page-link' href='/?pagina=".$i."'>".$i."</a></li>";
                        }
                    }
                }else{
                    $footer[$i] = "<li class='page-item ".$class."'><a class='page-link' href='/?pagina=".$i."'>".$i."</a></li>";
                }
            }
        }
        
        $footer = implode('',$footer);
        
        return $footerStr .= $footer . "</ul>";
    }
    
    public function validaArquivo($code) {

        switch ($code) {
            case 1:
            case 2:
            case 3:
                $message = "Arquivo muito grande, por favor selecione outro!";
                break;
            case 4:
                $message = "Por favor selecione um arquivo!";
                break;
            case 6:
                $message = "Diretorio nao encontrado, por favor tente novamente!";
                break;
            case 7:
                $message = "Erro ao salvar arquivo no servidor, por favor selecione outro!";
                break;
            case 8:
                $message = "Extensão inválida, por favor selecione outro arquivo!";
                break;
            default:
                $message = "Erro, por favor selecione outro!";
                break;
        }
        return $message;
    }
    
}
