<?php
/**
 * @copyright Copyright (c) 2019 FATEC OURINHOS
 * @author Gabriel da Silva pereira & Denilson Perez Junior
 * @since 26/07/2018
 */

namespace Quadro;

class Module
{
    const VERSION = '3.0.3-dev';
        
    public function getConfig()
    {
        return include __DIR__ . '/../config/module.config.php';
    }
}
