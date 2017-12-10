class UserController < ApplicationController

    def login
    end
     
    def user_login
        session[:login]=1
        session[:cart]=nil
        flash[:notice]= "Login Successful."
        redirect_to :controller => :items
    end
    
    def logout
        session[:login] = nil
        session[:cart] = nil
        flash[:notice] = "You have been succestully logged out."
        redirect_to :controller =>:items
    end

end
