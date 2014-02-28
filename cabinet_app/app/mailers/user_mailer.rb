class UserMailer < ActionMailer::Base
  default from: "admin@cabinet.com"

  def registration_confirmation(user)
    @user = user
    attachments['railslogo'] = File.read("#{Rails.root}/app/assets/images/rails.png")
    attachments['pin'] = File.read("#{Rails.root}/public/ex_pin.png")
    attachments.inline['logo2'] = File.read("#{Rails.root}/public/logo3.svg")
    mail(to: user.email, subject: 'Hello new user!')
  end

  def share_location(user, location)
    @user = user
    attachments['railslogo'] = File.read("#{Rails.root}/app/assets/images/rails.png")
    attachments['pin'] = File.read("#{Rails.root}/public/ex_pin.png")
    attachments.inline['logo2'] = File.read("#{Rails.root}/public/logo3.svg")
    mail(to: user.email, subject: 'Shared location')
  end

  def welcome
    attachments.inline['pin'] = File.read('/public/ex_pin.png')
    attachments.inline['logo2.png'] = File.read('/public/logo3.svg')
  end
end
