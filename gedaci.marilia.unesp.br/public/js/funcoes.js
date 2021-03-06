﻿$(document).ready(function () {
    $('[data-mask]').each(function() {
        $(this).mask($(this).attr("data-mask"));
    });
});

function validaParametros(parametros){
    retorno = true;
     
    $.each(parametros, function( index, value ) {
        if(!value || value == ''){            
            retorno = false;
        }
    });
    
    return retorno;
}

function getExt(filename){
    return filename.split('.').pop();
}

function validarHoras(hora) {
    var isValid = hora.match(/^([0-1][0-9]|2[0-3]):([0-5][0-9])$/g);
    if(isValid){
        return true;
    }else{
        return false;
    }
}

function validarData(data) {
    var isValid = data.match(/^\d{4}-\d{2}-\d{2}$/g);
    if(!isValid){
        return false;
    }
    
    var d = new Date(data);
    var dNum = d.getTime();
    if(!dNum && dNum !== 0){
        return false;
    } 
    
    return d.toISOString().slice(0,10) === data;
}

function getSemana(semana){
    
    switch (semana){
        case 1:
            return 'Domingo';
            break;
        case 2:
            return 'Segunda-Feira';
            break;
        case 3:
            return 'Terça-Feira';
            break;
        case 4:
            return 'Quarta-Feira';
            break;
        case 5:
            return 'Quinta-Feira';
            break;
        case 6:
            return 'Sexta-Feira';
            break;
        case 7:
            return 'Sábado';
            break;
    }
    
}