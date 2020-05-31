class ApplicationController < ActionController::Base
    before_action :set_categories
    before_action :authorized
    before_action :authorized_admin
    helper_method :current_user
    helper_method :logged_in?
    helper_method :logged_in_admin?

    def current_user
        User.find_by(id: session[:user_id])
    end
    def logged_in?
           
        !current_user.nil?
    end
    def authorized
       redirect_to '/login' unless logged_in?
    end

    def logged_in_admin?
        !current_user.nil?  && current_user.email == 'super_admin'
    end
    
    def authorized_admin
       redirect_to '/login' unless logged_in_admin?
    end

    private
 
    def set_categories
        @categories = Category.all
    end

    end