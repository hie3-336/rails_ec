# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# item = Item.create(name: 'テスト商品', description: 'テストの説明です！テストの説明です！', price: '1800円', number: 'TEST-01')

# item.image.attach(io: File.open('db/testimage/test.png'), filename: 'test.png')
# item.save!
require 'csv'

CSV.foreach('db/seeds.csv', headers: true) do |row|
  item = Item.create(
    name: row['name'],
    description: row['description'],
    price: row['price'],
    number: row['number']
  )
  item.image.attach(io: File.open("db/testimage/#{row['filename']}.jpg"), filename: "#{row['filename']}.png")
  item.save
end
