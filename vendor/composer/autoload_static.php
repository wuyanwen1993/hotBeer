<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit261a70bfc05070f3d5d0c6c610ad24f2
{
    public static $prefixesPsr0 = array (
        'M' => 
        array (
            'Monolog' => 
            array (
                0 => __DIR__ . '/..' . '/monolog/monolog/src',
            ),
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixesPsr0 = ComposerStaticInit261a70bfc05070f3d5d0c6c610ad24f2::$prefixesPsr0;

        }, null, ClassLoader::class);
    }
}
