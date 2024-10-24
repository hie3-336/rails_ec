# frozen_string_literal: true

class CheckoutMailer < ApplicationMailer
  default from: ENV['EMAIL_USER']

  def ordermail(purchase, coupon)
    @purchase = purchase
    @coupon = coupon
    mail(to: @purchase.mail, subject: '注文完了のお知らせ')
  end
end
