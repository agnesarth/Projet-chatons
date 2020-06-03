class StaticPagesMailer < ApplicationMailer
<<<<<<< HEAD
    def contact_email(first_name, last_name, email, subject, data)
        @user = last_name
=======
    default from: 'animalmatching2020@gmail.com'

    def contact_email(name, email, subject, data)
        @user = name
>>>>>>> mailer
        @user_email = email
        @body = data
        mail(to: 'animalmatching2020@yopmail.com', subject: subject)
    end
end
