<?php
/**
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2016 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application;

use Zend\Router\Http\Literal;
use Zend\Router\Http\Segment;
use Zend\ServiceManager\Factory\InvokableFactory;

return [
    'router' => [
        'routes' => [
            'home' => [
                'type' => Literal::class,
                'options' => [
                    'route'    => '/',
                    'defaults' => [
                        'controller' => Controller\IndexController::class,
                        'action'     => 'index',
                    ],
                ],
            ],
            'application' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/sistema[/:action]',
                    'defaults' => [
                        'controller' => Controller\IndexController::class,
                        'action'     => 'index',
                    ],
                ],
            ],
            'bem-vindo' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/bem-vindo',
                    'defaults' => [
                        'controller' => Controller\IndexController::class,
                        'action'     => 'bem-vindo',
                    ],
                ],
            ],
            'termo-inicial' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/termo-inicial',
                    'defaults' => [
                        'controller' => Controller\IndexController::class,
                        'action'     => 'termo-inicial',
                    ],
                ],
            ],
            'debug' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/debug',
                    'defaults' => [
                        'controller' => Controller\IndexController::class,
                        'action'     => 'debug',
                    ],
                ],
            ],
            'perfil' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/perfil[/:action]',
                    'defaults' => [
                        'controller' => Controller\PerfilController::class,
                        'action'     => 'perfil',
                    ],
                ],
            ],
            'alterar-dados' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/alterar-dados[/:action]',
                    'defaults' => [
                        'controller' => Controller\PerfilController::class,
                        'action'     => 'alterar-dados',
                    ],
                ],
            ],
            'salvar-doc' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/salvar-doc[/:action]',
                    'defaults' => [
                        'controller' => Controller\IndexController::class,
                        'action'     => 'salvar-doc',
                    ],
                ],
            ],
            'salvar-video' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/salvar-video[/:action]',
                    'defaults' => [
                        'controller' => Controller\IndexController::class,
                        'action'     => 'salvar-video',
                    ],
                ],
            ],
            'usuarios' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/usuarios[/:action]',
                    'defaults' => [
                        'controller' => Controller\UsuariosController::class,
                        'action'     => 'membros',
                    ],
                ],
            ],
            'email' => [
                'type'    => Segment::class,
                'options' => [
                    'route'    => '/email[/:action]',
                    'defaults' => [
                        'controller' => Controller\EmailsController::class,
                        'action'     => 'email',
                    ],
                ],
            ],
        ],
    ],
    'controllers' => [
        'factories' => [
            Controller\IndexController::class => InvokableFactory::class,
            Controller\PerfilController::class => InvokableFactory::class,
            Controller\UsuariosController::class => InvokableFactory::class,
            Controller\EmailsController::class => InvokableFactory::class
        ],
    ],
    'view_manager' => [
        'display_not_found_reason' => true,
        'display_exceptions'       => true,
        'doctype'                  => 'HTML5',
        'not_found_template'       => 'error/404',
        'exception_template'       => 'error/index',
        'template_map' => [
            'layout/layout'           => __DIR__ . '/../view/layout/layout.phtml',
            'application/index/index' => __DIR__ . '/../view/application/index/index.phtml',
            'error/404'               => __DIR__ . '/../view/error/404.phtml',
            'error/index'             => __DIR__ . '/../view/error/index.phtml',
        ],
        'template_path_stack' => [
            __DIR__ . '/../view',
        ],
    ],
];
