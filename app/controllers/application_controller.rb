class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authenticate_user!, :only => [:new, :create,:show]
  protect_from_forgery with: :exception

  
  
end
