# frozen_string_literal: true

namespace :promotion_code do
  desc 'クーポンコードを10枚発行するタスク'
  task generate: :environment do
    10.times do
      coupon = Coupon.new(cart_id: nil, discount: rand(1..10) * 100, code: SecureRandom.alphanumeric(7),
                          use: 'unused')
      coupon.save
    end
  end
end
