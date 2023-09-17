<?php

namespace ParkingSystem\Tests;

use PHPUnit\Framework\TestCase;
use GuzzleHttp\Client;
use ParkingSystem\Classes\Requests\Request;
use ParkingSystem\Router;

class RouterTest extends TestCase {
    protected $client;

    protected function setUp(): void {
        $this->client = new Client([
            'base_uri' => $_SERVER['APP_URL']
        ]);
    }

    public function test404() {
        $response = $this->client->get('/some-url', ['http_errors' => false]);
        
        $this->assertEquals(404, $response->getStatusCode());
    }

    public function testWrongHttpMethod() {
        $response = $this->client->request('NOT_HTTP_METHOD', 'fee/byzoneandplate', ['http_errors' => false]);
        $this->assertEquals(500, $response->getStatusCode());
    }

    public function testGoodControllerButWrongAction() {
        $response = $this->client->get('fee/wrong-ation', ['http_errors' => false]);
        $this->assertEquals(404, $response->getStatusCode());
    }

    public function testParseRequest() {
        $this->expectException(\Exception::class);
        $this->callRouterParseRequest();
    }

    private function callRouterParseRequest() : Request {
        $router = new \ReflectionClass(Router::class);
        $method = $router->getMethod('parseRequest');

        return $method->invokeArgs(new Router(), []);
    }
}