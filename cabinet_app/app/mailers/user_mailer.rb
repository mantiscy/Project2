class UserMailer < ActionMailer::Base
  default from: "admin@cabinet.com"

  def registration_confirmation(user)
    @user = user
    attachments['railslogo'] = File.read("#{Rails.root}/app/assets/images/rails.png")
    mail(to: user.email, subject: 'Hello new user!')
  end
end
