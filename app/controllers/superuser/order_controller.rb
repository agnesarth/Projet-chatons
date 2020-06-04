class Superadmin::OrdersController < ApplicationController
    before_action :check_if_superuser

    def index
        
    end


    private

    def check_if_superuser
        authenticate_user!

        if !current_user.superuser
            flash[:danger] = "Accès refusé"
            redirect_to root_path      
        end
    end
end