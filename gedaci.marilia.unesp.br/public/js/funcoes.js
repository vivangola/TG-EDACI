$(document).ready(function () {
    $('[data-mask]').each(function() {
        $(this).mask($(this).attr("data-mask"));
    });
});

function validaParametros(parametros = []){
    retorno = true;
    msg = "";
    defaultMsg = false;
    
    $.each(parametros, function( index, value ) {
        if(!value || value == ''){
            retorno = false;
            if($('#'+index).attr('title')){
                msg = msg + '<br><br>' + $('#'+index).attr('title');
            }else{
                defaultMsg = true;
            }
        }
    });
    
    if(msg != ""){
        Swal.fire({
            title: 'Atenção!',
            html: msg,
            type: 'info'
        });
    }
    
    if(defaultMsg){
        Swal.fire({
            title: 'Atenção!',
            html: "Digite todos os campos.",
            type: 'info'
        });
    }
    
    return retorno;
}