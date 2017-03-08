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
        
        flash[:notice] = "Thank you for your subscription! You may now reap the benifits that your Premium status has to offer!"
        
        redirect_to root_path
        
        rescue Stripe::CardError => e
            flash[:alert] = e.message
            redirect_to new_charge_path
    end
    
    def new
        unless current_user.admin?
            @stripe_btn_data = {
                key: "#{Rails.configuration.stripe[:publishable_key] }",
                description: "Premium Subscription - #{current_user.email}",
                amount: Amount.default
            }
        else           
            flash[:alert] = "As an admin you are granted full permissions, there is no need to upgrade."
            redirect_to root_path
        end
    end
    
    def downgrade
        if current_user.premium?
            current_user.standard!
            
            Wiki.where(user_id: current_user.id).update_all(private: 'false')
            
            flash[:notice] = "Your account has successfully been downgraded. We are glad to have been able to help you with this."
        elsif current_user.admin?
            flash[:alert] = "As an admin you are granted full permissions, and downgrading is not posible."
        else
            flash[:alert] = "Sorry, that action cannot be completed with your current membership status."
        end
        redirect_to root_path
    end
end
