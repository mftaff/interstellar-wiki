class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    Rails.logger.info "Here I am!, #{'some var'}"
  end

  def about
  end
end
