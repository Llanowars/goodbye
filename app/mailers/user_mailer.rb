class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def unsub_email(user)
    @user = user
    mail(to: @user.email, subject: 'Freeme - Votre désinscription')
  end

  # attachments['filename.jpg'] = File.read('/path/to/filename.jpg')
end
