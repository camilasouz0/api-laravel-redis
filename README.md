
## SOBRE O PROJETO
É uma api em laravel, utiza, o sistema phpunit, coverage e a tecnologia redis para o cacheamento.

### OBJETIVO
Aprendizado pessoal.

## INSTALAÇÃO
Fazer o clone do projeto
```bash
git clone https://github.com/camilasouz0/api-laravel-redis-phpunit-coverage.git
```
Instalar as dependências
```bash
composer install
```

## RUN

Antes de rodar em sua máquina será necessario dar os seguintes comandos
Dar Start no redis
```bash
redis-server.exe redis.windows.conf
```
```bash
php artisan migrate
```
```bash
php artisan serve
```
Realizar o cadastro em http://localhost:8000/register
Realizar o login em http://localhost:8000/login
Com a authenticação realizada você terá acesso a consuta da api http://localhost:8000/cat?consulta=persa

## RUN COM TESTES
Passos para rodar a api com o sitema de testes
Modificar o arquico `.env`

```bash
APP_ENV=local
```
Para
```bash
APP_ENV=testing
```
Será necessrio também localiza o arquivo `login.blade.php` que fica em `resources > views`. Retirar ou comentar o `@csrf`
Dar o comando de limpar o cache
```bash
php artisan config:clear
```
E o de cache
```bash
php artisan config:cache
```
