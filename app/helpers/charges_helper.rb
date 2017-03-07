module ChargesHelper
    def render_charge_button
        @stripe_btn_data = {
            key: "#{Rails.configuration.stripe[:publishable_key] }",
            description: "Premium Subscription - #{current_user.email}",
            amount: Amount.default
        }
        "<script class='stripe-button profile-link' src='https://checkout.stripe.com/checkout.js' data-key='#{@stripe_btn_data[:key]}' data-amount='#{@stripe_btn_data[:amount]}' data-description='#{@stripe_btn_data[:description]}'></script>".html_safe
    end
end
