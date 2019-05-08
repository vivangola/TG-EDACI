<?php

namespace Application\Classes;

use DOMPDFModule\View\Model\PdfModel;
use Zend\View\Model\ViewModel;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Relatorio
 * @author Robson Martins Lopes
 * @since 27/01/2016
 */
class Relatorio {
    
    private $service_translator;
    private $desc_coluna = array();
    private $db_campo = array();
    private $variavel_campo = array();
    private $tipo_campo = array();
    private $tamanho_coluna = array();
    private $alinhamento_coluna = array();
    private $repete_valor = array();
    private $cor_fundo = array();
    private $cor_fonte = array();
    private $classe_fundo = array();
    private $link = array();
    private $classe = array();
    private $coluna;
    private $alterna_cor;
    private $quebra_campo;
    private $quebra_descricao;
    private $quebra_anterior;
    private $quebra_cabecalho;
    private $quebra_cor_fundo;
    private $sub_total_exibir;
    private $zerar_sub_total;
    private $exibirTotal;
    private $exibirSubTotal = 1;
    
    public function __construct() {
        $this->coluna = 0;
        $this->alterna_cor = array(true, '#FFFFFF', '#FFFFFF');
        $this->sub_total_exibir = 0;
        $this->zerar_sub_total = 0;
        $this->exibirTotal = 0;
    }
    
    function getExibirSubTotal() {
        return $this->exibirSubTotal;
    }

    function setExibirSubTotal($exibirSubTotal) {
        $this->exibirSubTotal = $exibirSubTotal;
    }

    /**
     * Método para setar o alterar cor de fundo.
     * @param string $exibir Se a será alternada a cor [true|false]
     * @param string $primeira_cor Primeira cor das cores alternadas, padrão [#FFFFFF]
     * @param string $segunda_cor Segunda cor das cores alternadas, padrão [#F2F2F2]
     */
    public function definirCorFundo($exibir, $primeira_cor = '#FFFFFF', $segunda_cor = '#F2F2F2') {
        $this->alterna_cor = array($exibir, $primeira_cor, $segunda_cor);
    }

    public function getVariavel($campo) {
        return $this->variavel_campo[$campo];
    }

    public function definirVariavel($campo, $valor) {
        $this->variavel_campo[$campo] = $valor;
    }
    
    
    public function setClasse($campo, $valor) {
        $this->classe[$campo] = $valor;
    }
    
    public function setServiceTranslate(\Zend\Mvc\I18n\Translator $service_translator){
        $this->service_translator = $service_translator;
    }
    
    private function verificaServiceTranslate(){        
        return isset($this->service_translator);
    }

    /**
     * Método para definir link para uma coluna
     * @param string $coluna Para qual coluna o link está sendo definido [$db_campo] de definirColuna()
     * @param string $link O link [href] para onde será redirecionado (obs: pode ser uma função javascript)
     * @param integer $target [opcional valor default: 0]<p>
     * 0: para abrir o link na mesma página</p><p>
     * 1: para abrir o link em nova guia</p>
     */
    public function definirLink($coluna, $link, $target = 0, $onclick = false) {
        $this->link[$coluna] = array($coluna, $link, $target, $onclick);
    }

    /**
     * Método para definir as configurações de cada coluna a ser exibida no relatório 
     * @param string $descricao Descrição da exibição da coluna 
     * @param string $db_campo <p>
     *  Nome do campo que vem do resultado do banco de dados ou
     *  nome de variavel a ser utilizada </p>
     * @param string $tam_coluna Tamanho da coluna para exibição
     * @param string $alinhamento Tipo de alinhamento do conteúdo
     * @param string $tipo_coluna Tipo de conteúdo que será exibido ['t'] ou ['0-9'] para quantidade de casas decimais
     * @param string $calc_total Se a coluna será calculado a somatória para exibir total
     * @param string $repete_valor Se a coluna exibirá valores repetidos
     * @param string $cor_fundo A cor de fundo da coluna
     * @param string $classe_fundo Classe a ser adicionada na tag <font>.
     * 
     * */
    public function definirColuna($descricao, $db_campo, $tam_coluna, $alinhamento, $tipo_coluna, $calc_total, $repete_valor, $cor_fundo = "#FFFFFF", $classe_fundo="") {
        $this->desc_coluna[$db_campo] = $descricao;
        $this->db_campo[$db_campo] = $db_campo;
        $this->tamanho_coluna[$db_campo] = $tam_coluna;
        $this->alinhamento_coluna[$db_campo] = $this->setAlinhamento($alinhamento);
        $this->tipo_campo[$db_campo] = $tipo_coluna;
        $this->calc_total[$db_campo] = $calc_total;
        if ($calc_total === "s") {
            $this->exibirTotal = 1;
            $this->total[$db_campo] = array(0, array($this->setAlinhamento($alinhamento), $tipo_coluna));
            $this->sub_total[$db_campo] = array(0, array($this->setAlinhamento($alinhamento), $tipo_coluna));
        } else {
            $this->total[$db_campo] = array("", array($this->setAlinhamento($alinhamento), $tipo_coluna));
            $this->sub_total[$db_campo] = array("", array($this->setAlinhamento($alinhamento), $tipo_coluna));
        }
        $this->repete_valor[$db_campo] = $repete_valor;
        $this->cor_fundo[$db_campo] = $cor_fundo;
        $this->classe_fundo[$db_campo] = $classe_fundo;
        $this->cor_fonte[$db_campo] = '#000000';
        $this->coluna = $this->coluna + 1;
        $this->classe[$db_campo] = '';
    }

    /**
     * Método para definir as configurações de cada quebra a ser exibida no relatório 
     * @param string $descricao Descrição da exibição da coluna 
     * @param string $db_campo <p>
     *  Nome do campo que vem do resultado do banco de dados ou
     *  nome de variavel a ser utilizada para realizar a quebra</p>
     * @param string $quebra_anterior O nome do campo da quebra anterior caso tenha uma quebra anterior definida,
     * @param string $cabecalho Nome do campo que vira do banco de dados para ser concatenado com a descrição da quebra
     * @param string $cor_quebra Cor de fundo da Quebra
     * 
     * */
    public function definirQuebra($descricao, $db_campo, $quebra_anterior, $cabecalho, $cor_quebra = "#EAEAEA") {
        $this->quebra_campo[$db_campo] = $db_campo;
        $this->quebra_descricao[$db_campo] = $descricao;
        $this->quebra_anterior[$db_campo] = $quebra_anterior;
        $this->quebra_cabecalho[$db_campo] = $cabecalho;
        $this->quebra_anterior[$db_campo] = "";
        $this->quebra_cor_fundo[$db_campo] = strtoupper($cor_quebra);
    }

    /**
     * Gera o cabeçalho do relatório criando a tabela com a descrição de cada coluna definida em definirColuna()
     * @param integer $tamanho Tamanho da tabela do relatório<p>
     * Pode ser de [1-12] que usa a classe de tamanho do bootstrap col-md-[1-12]</p>
     */
    public function gerarCabecalho($tamanho, $cabecalho_superior = array()) {                     
        echo "<div class='col-md-" . $tamanho . " table-responsive'>";
        echo "<table id='relatorio' class='tabelafixada table table-hover table-bordered' style='font-size: 12px;'>";
        echo "<thead>";
        
        if($cabecalho_superior){            
            echo "<tr>";
            foreach ($cabecalho_superior as $key => $arr) {                    
                echo "<th class='text-center add-back-seg' colspan=".$arr[key($arr)].">" . key($arr) . "</th>";
            }
            echo "</tr>";
        }
        
        
        echo "<tr>";
        foreach ($this->desc_coluna as $key => $desc) {
            echo "<th class='text-center ' style='vertical-align:middle' width='" . $this->tamanho_coluna[$key] ."%'>" . $desc . "</th>";
        }
        echo "</tr>";
        echo "</thead>";
        echo "<tbody>";
    }

    public function setCorColunaFundo($campo, $valor) {
        $this->cor_fundo[$campo] = $valor;
    }

    public function setCorColunaFonte($campo, $valor) {
        $this->cor_fonte[$campo] = $valor;
    }

    /**
     * Método responsável por receber uma linha do resultSet por vez e montar o corpo do relatorio 
     * @param resultSet $linha Recebe uma linha por vez para montar o relatório
     */
    public function gerarRelatorio($linha) {
        $cor = $this->alternarCorFundo();
        $this->exibirQuebra($linha);
//        ECHO "<PRE>";
//        ECHO VAR_DUMP($this->cor_fundo);
//        ECHO "</PRE>";
        echo "<tr>";
        foreach ($this->db_campo as $campo) {




            if (strlen($this->cor_fundo[$campo]) > 0) {
                if (strpos($this->cor_fundo[$campo], '[') === 0) {
                    $cor = $linha[str_replace(array('[', ']'), "", $this->cor_fundo[$campo])];
                } else {
                    $cor = $this->cor_fundo[$campo];
                }

                if (strpos($this->cor_fundo[$campo], '@') === 0) {
                    $this->cor_fonte[$campo] = str_replace(array('@'), "#", $this->cor_fundo[$campo]);
                    $cor = "";
                }
            }    
            
            $align = $this->alinhamento_coluna[$campo];
            //verifica se o valor do conteúdo é um numero para calcular o sub_total e total 
            if (is_numeric($this->tipo_campo[$campo]) === true) {
                if (is_numeric($campo) === true) {
                    $valor_imprimir = $this->variavel_campo[$campo];
                    $this->calcularTotal($this->variavel_campo, $campo);
                } else {
                    $valor_imprimir = $linha[$campo];
                    $this->calcularTotal($linha, $campo);
                }
                $valor_imprimir = number_format($valor_imprimir, $this->tipo_campo[$campo], ",", ".");
                
            } else {
                if (is_numeric($campo) === true) {
                    $valor_imprimir = $this->variavel_campo[$campo];
                } else {
                    $valor_imprimir = $linha[$campo];
                }
            }
            echo "<td width='" . $this->tamanho_coluna[$campo] ."%' class='" . $align." ".$this->classe[$campo]. "' bgcolor='" . $cor . "'>";
            //verifica se tem link e monta o  link com o valor para imprimir
            if (strlen($this->cor_fonte[$campo]) > 0) {
                if (strlen($this->classe_fundo[$campo]) > 0) {
                    echo "<font color = '" . $this->cor_fonte[$campo] . "' class = '" . $this->classe_fundo[$campo] . "'>";
                } else {
                    echo "<font color = '" . $this->cor_fonte[$campo] . "'>";
                }
                echo $this->imprimirValor($linha, $campo, $valor_imprimir);
                echo "</font>";
            } else {
                echo $this->imprimirValor($linha, $campo, $valor_imprimir);
            }
            echo "</td>";
        }
        echo "</tr>";
        if ($this->zerar_sub_total === 1) {
            $this->zerar_sub_total = 0;
        }
    }

    /**
     * Método privado para alternar as cores de fundo do relatório 
     */
    private function alternarCorFundo() {
        if ($this->alterna_cor[0] === true) {
            $cor = $this->alterna_cor[1];
            $this->alterna_cor[0] = false;
        } else {
            $cor = $this->alterna_cor[2];
            $this->alterna_cor[0] = true;
        }
        return $cor;
    }

    /**
     * Verifica se a coluna possui um link e o cria caso tenha. O resultado de retorno será apenas um echo
     * com o valor da coluna formatado e com link caso algum tenha sido definido.
     * @param string $linha A linha com os campos do resultSet
     * @param string $campo O nome do campo(da coluna) que está sempre impresso no tabela
     * @param string $valor_imprimir O valor já formatado que será impresso na tabela
     * 
     */
    private function imprimirValor($linha, $campo, $valor_imprimir) {
        $abre_link = "";
        $fecha_link = "";        
        if (count($this->link) > 0) {
            if (isset($this->link[$campo][0]) === true && $this->link[$campo][1] != '') {
                $link_redirecionar = $this->link[$campo][1];
                $variaveis = explode("[", $link_redirecionar);
                foreach ($variaveis as $chave => $valor) {
                    $item = explode("]", $valor);
                    $variaveis[$chave] = $item[0];
                }
                if (count($variaveis) > 0) {
                    foreach ($variaveis as $chave1 => $valor1) {
                        if ($chave1 > 0) {
                            $link_redirecionar = str_replace("[" . $valor1 . "]", $linha[$valor1], $link_redirecionar);
                        }
                    }
                }
                if ($this->link[$campo][2] === 1) {
                    $target = "_blank";
                } else {
                    $target = "";
                }
                
                $onclick= $this->link[$campo][3];
                
                if($onclick)
                    $abre_link = "<a style='cursor: pointer;' onclick=\"" . $link_redirecionar . "\" target='" . $target . "'>";
                else
                    $abre_link = "<a href=\"" . $link_redirecionar . "\" target='" . $target . "'>";
                $fecha_link = "</a>";
            } else {
                $abre_link = "";
                $fecha_link = "";
            }
        }
        $valor_imprimir = $this->verificaServiceTranslate() ? $this->service_translator->translate($valor_imprimir) : $valor_imprimir;
        echo $abre_link . $valor_imprimir . $fecha_link;
    }

    /**
     * Gera o rodapé do relatorio exibindo o total geral caso tenha alguma coluna de somatória e 
     * fecha a tabela do relatório
     */
    public function gerarRodape() {
        if ($this->exibirTotal > 0) {
            $this->exibirTotalGeral();
        }
        echo "</tbody>";
        echo "</table>";
        echo "</div>";
    }

    private function calcularTotal($linha, $campo) {
        if ($this->calc_total[$campo] === "s") {
            $this->total[$campo][0] = $this->total[$campo][0] + $linha[$campo];
            if ($this->zerar_sub_total === 1) {
                $this->sub_total[$campo][0] = 0 + $linha[$campo];
            } else {
                $this->sub_total[$campo][0] = $this->sub_total[$campo][0] + $linha[$campo];
            }
        }
    }

    /**
     * Exibe o a última linha do relatorio com a somatória de cada coluna definida como somatoria 
     */
    private function exibirTotalGeral() {
        if (count($this->quebra_campo) > 0) {
            $this->exibirSubTotal();
        }
        $align = "text-right";
        $cor = "#b0b0b0";
        echo "<tr>";
        echo "<td class='text-left add-back-seg'><b>TOTAL</b></td>";
        $primeira_coluna = 1;
        foreach ($this->total as $total) {
            if (strlen($total[0]) === 0) {
                if ($primeira_coluna === 0) {
                    echo "<td class='add-back-seg'></td>";
                } else {
                    $primeira_coluna = 0;
                }
            } else {
                echo "<td class='" . $total[1][0] . " add-back-seg '><b>" . number_format($total[0], $total[1][1], ",", ".") . "</b></td>";
            }
        }
        echo "</tr>";
    }

    /**
     * Exibe o uma linha com a somatória dos valores de cada coluna definida como somatoria contidos dentro de uma quebra
     */
    private function exibirSubTotal() {
        if ($this->exibirSubTotal){
            $align = "text-right";
            $cor = "#69b2f5";
            echo "<tr>"; //style='color: #ffffff'
            echo "<td class='text-left add-back-seg'>SUB-TOTAL</td>";
            $primeira_coluna = 1;
    //        echo "<pre>";
    //        var_dump($this->sub_total);
    //        echo "</pre>";
            foreach ($this->sub_total as $sub_total) {
                if (strlen($sub_total[0]) === 0) {
                    if ($primeira_coluna === 0) {
                        echo "<td class='add-back-seg'></td>";
                    } else {
                        $primeira_coluna = 0;
                    }
                } else {
                    echo "<td class='" . $sub_total[1][0] . " add-back-seg'>" . number_format($sub_total[0], $sub_total[1][1], ",", ".") . "</td>";
                }
            }
            echo "</tr>";
        }
    }

    /**
     * Exibe todas as quebras de páginas definidas por definirQuebra()
     * @param array $linha Uma linha do resultSet que vem do BD 
     */
    private function exibirQuebra($linha) {
        if (count($this->quebra_campo) > 0) {
            foreach ($this->quebra_campo as $quebra) {
//                se a quebra atual for diferente da quebra anterior exibir a quebra
                if ($linha[$quebra] !== $this->quebra_anterior[$quebra]) {
//                  codição para não exibir o sub-total como a primeira linha do relatorio
                    if (count($this->sub_total) > 0 && $this->sub_total_exibir === 1) {
                        $this->exibirSubTotal();
                        $this->zerar_sub_total = 1;
                        $this->sub_total_exibir = 0;
                    }
                    $desc_quebra = $this->quebra_descricao[$quebra] . $linha[$this->quebra_cabecalho[$quebra]];
                    $colspan = count($this->db_campo);
                    $cor = $this->quebra_cor_fundo[$quebra];

                    echo "<tr>";
                    echo "<td class='text-left' bgcolor='" . $cor . "' colspan='" . $colspan . "'><b>" . $desc_quebra . "</b></td>";
                    echo "</tr>";
                    $this->quebra_anterior[$quebra] = $linha[$quebra];
                }
            }
//            após gerar as primeiras quebras permite exibir o subtotal            
            $this->sub_total_exibir = 1;
        }
    }

    /**
     * Método que recebe um valor string e traduz para uma classe de alinhamento do bootstrap
     * ou dispara uma exceção 
     * @param string $tipo Tipo de alinhamentro do texto da coluna<p>
     * Valores permitidos [center|left|right]</p>
     * @return string Retorna a classe do bootstrap referente ao alinhamento de texto
     * @throws \Exception Dispara uma exceção caso o valor do parâmetro seja invalido
     */
    private function setAlinhamento($tipo = '') {
        switch ($tipo) {
            case 'center':
                return 'text-center';
                break;
            case 'left':
                return 'text-left';
                break;
            case 'right':
                return 'text-right';
                break;
            default:
                throw new \Exception("O parâmetro '$tipo' em setAlinhamento('$tipo') deve ser [center|left|right]");
                return "erro";
        }
    }

    public function criarPDF($nome, $template, $param_view) {
        $pdf = new PdfModel();
        $pdf->setTemplate($template);
        $pdf->setOption('filename', $nome); // Triggers PDF download, automatically appends ".pdf"
        $pdf->setOption('paperSize', 'a4'); // Defaults to "8x11"
        $pdf->setOption('paperOrientation', 'landscape'); // Defaults to "portrait"
        // To set view variables
        //$sessao = new Container('relatorio');

        $pdf->setVariables($param_view);

        return $pdf;
    }

    public function criarTXTCSV($nome, $tipo, $cabecalho, $dados, $campos) {
        header("Content-Type: text/" . ($tipo == 'txt' ? 'html' : $tipo) . "; charset=CP1252");
        header("Content-Disposition: attachment; filename=$nome.$tipo");

        foreach ($cabecalho as $cab):
            echo trim($cab) . ";";
        endforeach;

        echo "\r\n";

        foreach ($dados as $relatorio):
            foreach ($campos as $campo):
                if (strtotime($relatorio[$campo]) && !is_numeric($relatorio[$campo]))
                    echo date("d/m/Y", strtotime($relatorio[$campo])) . ';';
                else
                    echo ($relatorio[$campo] == '.00' ? $relatorio[$campo] * 1 : trim($relatorio[$campo])) . ";";
//        echo '<br>';
            endforeach;
//            echo "<br>";
//            echo "<br>";
//            echo "<br>";
            echo "\r\n";
        endforeach;
        exit;
    }

    public function criarXLS($nome, $campos, $cabecalho, $dados) {
        header("Pragma: public");
        header("Cache-Control: no-store, no-cache, must-revalidate");
        header("Cache-Control: pre-check=0, post-check=0, max-age=0");
        header("Pragma: no-cache");
        header("Expires: 0");
        header("Content-Transfer-Encoding: none");
        header("Content-Disposition: attachment; filename=$nome.xls");
        ?>
        <html>
            <body>
                <table border="1">
                    <tr>
                        <?php foreach ($cabecalho as $coluna): ?>
                            <th><?php echo $coluna; ?></th>
                        <?php endforeach; ?>
                    </tr>
                    <?php foreach ($dados as $dado): ?>
                        <tr>
                            <?php foreach ($campos as $col): ?>
                                <td>
                                    <?php
                                    if (strtotime($dado[$col]) && !is_numeric($dado[$col]))
                                        echo date("d/m/Y", strtotime($dado[$col]));
                                    else
                                        echo $dado[$col];
                                    
                                    ?>
                                </td>
                            <?php endforeach; ?>
                        </tr>
                    <?php endforeach; ?>
                </table>
            </body>
        </html>
        <?php
        exit;
    }
    
    
    public function gerarArquivo($cabecalho, $dados, $nome, $campos, $endereco, $doc) {        
        switch ($doc):
            case 'excel_csv':
                return $this->criarTXTCSV($nome, 'csv', $cabecalho, $dados, $campos);
            case 'excel_xls':
                return $this->criarXLS($nome, $campos, $cabecalho, $dados);
            case 'txt':
                return $this->criarTXTCSV($nome, 'txt', $cabecalho, $dados, $campos);
        endswitch;

        $view = new ViewModel(array('endereco' => $endereco));
        $view->setTemplate('relatorio/gerar-arquivo/gerar');
        return $view;
    }

}
