class WelcomeController < ApplicationController
  
  skip_before_action :authenticate_user!, only: [:index, :about]
  def index
    Rails.logger.info current_user.inspect
  end

  def about
  end
end
