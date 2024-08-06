class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_devise_variables

  private

  def set_devise_variables
    if user_signed_in?
      @resource = User.new
      @resource_name = :user
    else
      @resource_name = :user
      @resource = User.new
    end
  end
end
