# frozen_string_literal: true

class RegistrationMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Thanks for signing up!')
  end
end
