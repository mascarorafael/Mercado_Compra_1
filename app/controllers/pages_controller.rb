class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:some_protected_action]

  def quemsomos
  end

  def desapegados
  end

  def contact
  end

  def some_protected_action
  end
end
