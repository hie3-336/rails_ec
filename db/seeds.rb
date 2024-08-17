# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

item = Item.create(name: 'テスト商品', description: 'テストの説明です！テストの説明です！', price: '1800円', number: 'TEST-01')

item.image.attach(io: File.open('storage/test.png'), filename: 'test.png')
item.save!