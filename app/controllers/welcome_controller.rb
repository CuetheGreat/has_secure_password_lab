class WelcomeController < ApplicationController
  helper_method :current_user
  before_action :require_login

  def home
  end
end
