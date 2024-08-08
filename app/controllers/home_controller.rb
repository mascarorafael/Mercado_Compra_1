class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:index] # Certifique-se de que esta linha está correta e usa ações válidas.

  def index
    if user_signed_in?
      redirect_to products_path
    else
      redirect_to new_user_session_path
    end
  end
end
