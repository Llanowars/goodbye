class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Freeme - Votre désinscription')
  end

  # attachments['filename.jpg'] = File.read('/path/to/filename.jpg')
end
