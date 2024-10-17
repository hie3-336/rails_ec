namespace :promotion_code do
  desc "クーポンコードを10枚発行するタスク"
  task generate: :environment do 
    10.times do
      coupon = Coupon.new(cart_id: nil, discount: (rand(10) + 1) * 100, code: SecureRandom.alphanumeric(7), use: false )
      coupon.save
    end
  end
end
