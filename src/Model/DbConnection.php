<?php

namespace ParkingSystem\Model;

use Doctrine\DBAL\Configuration;
use Doctrine\DBAL\Connection;
use Doctrine\DBAL\DriverManager;
use Doctrine\ORM\ORMSetup;

class DbConnection {

    private static Connection|null $connection = null;

    public static function getDbConfig() : Configuration{
        $config = ORMSetup::createAttributeMetadataConfiguration([__DIR__.'/Entity'], true);
        $config->setProxyDir('/tmp/php/doctrine/');
        return $config;
    }
    
    public static function getDbConnection() : Connection {
        if(DbConnection::$connection === null){
            DbConnection::$connection = DriverManager::getConnection([
                'driver'   => 'pdo_mysql',
                'user'     => $_SERVER['DB_USERNAME'],
                'password' => $_SERVER['DB_PASSWORD'],
                'dbname'   => $_SERVER['DB_DATABASE'],
                'host'   => $_SERVER['DB_HOST']
            ], DbConnection::getDbConfig());
        }
        return DbConnection::$connection;
    }
}