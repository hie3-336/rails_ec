# README

Railsにより作成したECサイトのデモです。

# 本番環境

https://floating-springs-01753-38230b9c7601.herokuapp.com/

## デモ動画
https://github.com/user-attachments/assets/95d44ad1-1733-428d-bcd5-6928f12ffc43

## 実装の特徴
- Rails 7.0.8.4 で開発
- 画像保存はActiveStorageを使用 保存先はAWS S3
- Herokuでデプロイ
- 現役エンジニアの方にPRを依頼しながら制作しました

## 機能特徴
- 商品購入後明細メール配信
- クーポンコード割引機能
- 管理者用向け商品CRUD管理機能と注文履歴閲覧機能実装

## ER図
![Image](https://github.com/user-attachments/assets/b603c615-6c9e-42b0-9a9b-8954fa2d6eec)

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

