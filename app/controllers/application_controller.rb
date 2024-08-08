class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_devise_variables
  before_action :set_resource_name

  def after_sign_in_path_for(resource)
    products_path # Redireciona para a página inicial dos produtos após o login
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path # Redireciona para a página de login após o logout
  end

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

  def set_resource_name
    @resource_name = :user
    @resource = User.new
  end
end
