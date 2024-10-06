class CheckoutMailer < ApplicationMailer
  default from: ENV['EMAIL_USER']

  def ordermail(purchase)
    @purchase = purchase
    mail(to: @purchase.mail, subject: "注文完了のお知らせ")
  end
end
