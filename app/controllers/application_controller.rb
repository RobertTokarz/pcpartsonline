class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def load_categories
   @categories = Category.all
  end
  
  before_action:load_categories
  
  protect_from_forgery with: :exception
    
end
