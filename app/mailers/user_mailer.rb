class UserMailer < ApplicationMailer
  default from: 'animalmatching2020@gmail.com'

  def welcome_email(user)
    @user = user
    @url = "https://boiling-inlet-79758.herokuapp.com/"
    mail(to: @user.email, subject: "Bienvenue sur Chatons!")
  end
end
