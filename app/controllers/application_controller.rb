class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authenticate_user!, :only => [:new, :create,:show]
  protect_from_forgery with: :exception

  def stripe_checkout
  @amount = 10
  #This will create a charge with stripe for $10
  #Save this charge in your DB for future reference
  charge = Stripe::Charge.create(
                  :amount => @amount * 100,
                  :currency => "usd",
                  :source => params[:stripeToken],
                  :description => "Test Charge"
  )
  flash[:notice] = "Successfully created a charge"
  redirect_to '/subscription'
end
  
end
