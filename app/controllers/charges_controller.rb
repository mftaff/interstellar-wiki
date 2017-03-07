class ChargesController < ApplicationController
    def create
        customer = Stripe::Customer.create(
            email: current_user.email,
            card: params[:stripeToken]
        )
        
        charge = Stripe::Charge.create(
            customer: customer.id,
            amount: Amount.default,
            description: "Premium Subscription - #{current_user.email}",
            currency: 'usd'
        )
        
        current_user.premium!
        
        flash[:notice] = "Thank you for your subscription!\nYou may now reap the benifits that your Premium status has to offer!"
        
        redirect_to root_path
        
        rescue Stripe::CardError => e
            flash[:alert] = e.message
            redirect_to new_charge_path
    end
    
    def new
        @stripe_btn_data = {
            key: "#{Rails.configuration.stripe[:publishable_key] }",
            description: "Premium Subscription - #{current_user.email}",
            amount: Amount.default
        }
    end
end
