class StaticPagesMailer < ApplicationMailer
    def contact_email(first_name, last_name, email, subject, data)
        @user = last_name
        @user_email = email
        @body = data
        mail(from: email, to: 'animalmatching2020@gmail.com', subject: subject)
    end
end
