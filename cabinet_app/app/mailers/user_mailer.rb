class UserMailer < ActionMailer::Base
  default from: "admin@cabinet.com"

  def registration_confirmation(user)
    @user = user
    attachments['railslogo'] = File.read("#{Rails.root}/app/assets/images/rails.png")
    attachments['pin'] = File.read("#{Rails.root}/public/ex_pin.png")
    attachments.inline['logo2'] = File.read("#{Rails.root}/public/logo2.png")
    mail(to: user.email, subject: 'Hello new user!')
  end

  def share_location(user, location)
    #@user = user
    #attachments['railslogo'] = File.read("#{Rails.root}/app/assets/images/rails.png")
    mail(to: user.email, subject: 'Shared location')
  end

  def welcome
    attachments.inline['ex_pin.png'] = File.read('/public/ex_pin.png')
    attachments.inline['logo2.png'] = File.read('/public/logo2.png')
  end
end
