class UserMailer < ApplicationMailer

	def inactive_mail(user)
	@user = user
    mail(to: @user.email, subject: 'Sample Email')

	end

	def invitation_mail(user, email)
     @email = email
	@user = user
    mail(to: @user.email, subject: 'Sample Email')

	end

	def status_mail(ticket, email)
		@ticket = ticket
		mail(to: email, subject: 'Sample Email')

	end

end
