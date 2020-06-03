class StaticPagesController < ApplicationController
  def about
  end

  def home
  end

  def contact
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    subject = params[:subject]
    data = params[:body]
    Mailer.contact_email(first_name, last_name, email, subject, data).deliver
  end

end