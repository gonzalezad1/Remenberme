class TransactionsController < ApplicationController

  def new
    gon.client_token = generate_client_token
  end

 
  def create
    result = Braintree::Transaction.sale(
    :amount => "1000.00",
    :payment_method_nonce => nonce_from_the_client,
    :options => {
    :submit_for_settlement => true
      }
    )

    if result.success?
      puts "success!: #{result.transaction.id}"
    elsif result.transaction
      puts "Error processing transaction:"
      puts "  code: #{result.transaction.processor_response_code}"
      puts "  text: #{result.transaction.processor_response_text}"
    else
      p result.errors
    end
  end

  private
    def generate_client_token
      Braintree::ClientToken.generate
    end

    def check_cart
      if current_user.get_cart_movies.blank?
        redirect_to root_url, alert: "Please add some items to your cart before processing your transaction!"
      end
    end
end
