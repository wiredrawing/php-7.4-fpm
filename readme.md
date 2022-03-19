# Dockerコンテナでphp:7.4.27-fpmを動作させる


## Dockerfileからイメージを構築する

```
docker build -t php .

```

## 作成したイメージからコンテナを作成する

```

docker container create -it --name php -v $PWD:/var/www/html -p 9000:9000 php

```

## 作成したコンテナを起動する

```
docker container start php

```

## php-fpmが動作するnginxサーバのコンテナを作成

```
docker container create -it --name nginx -p 8888:80 -v $PWD/conf.d/:/etc/nginx/conf.d/ nginx

```

## 作成したnginxサーバコンテナを起動する

```
docker container start nginx

```

## ブラウザで localhost:8888 へアクセスする

**http://localhost:8888**

phpinfoの内容が出力されればOK
