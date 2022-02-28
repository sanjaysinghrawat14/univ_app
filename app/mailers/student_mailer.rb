class StudentMailer < ApplicationMailer

    default from: 'do-notreply@example.com'

  def welcome_email
    @student = params[:student]
    @url  = 'http://localhost:3002/login'
    mail(to: @student.email, subject: 'Welcome to My Awesome Site')
  end
end
