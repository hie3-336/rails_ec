# README

Railsにより作成したECサイトのデモです。

# 本番環境

https://floating-springs-01753-38230b9c7601.herokuapp.com/

## ローカル環境で実行する場合のsetup

- dockerが必要です。

```
docker compose build
```

```
docker compose run --rm web bin/setup
```

```
docker compose run --rm web yarn install
```

## run

```
docker compose up
```

http://localhost:3000

