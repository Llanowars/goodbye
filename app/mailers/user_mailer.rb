class UserMailer < ApplicationMailer
  default from: 'notifications@fleeme.fr'

  def unsub_email(unsub)
    @unsub = unsub
    mail(to: @unsub.user.email, subject: 'Freeme - Résiliation' )
  end



end
