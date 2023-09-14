<?php

spl_autoload_extensions(".php");

/*
 * Every time a php file use the keyword "use", we need to
 * show where is the proper path.
 * 
 * example:
 * \ParkingSystem\Some\Path => \src\Some\Path
 */
spl_autoload_register(function ($fullQualifiedClassName) {
    $parts = explode('\\', $fullQualifiedClassName);
    // Replace first folder from namespace with the actual folder
    unset($parts[0]);
    $classPath = implode("/", $parts);

    $filePath = __DIR__ . "/$classPath.php";
    if(file_exists($filePath)){
        // concat proper fodler (/src)
        include_once $filePath;
    }
});


// Validate and load .env config
try {
    $dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
    $dotenv->load();
    $dotenv->required([
        'APP_KEY',
        'APP_URL',
        'DB_CONNECTION',
        'DB_HOST',
        'DB_PORT',
        'DB_DATABASE',
        'DB_USERNAME',
        'DB_PASSWORD'
    ])->notEmpty();
} catch (Dotenv\Exception\ValidationException $ex) {
    echo $ex->getMessage();
    exit();
}