class HomeController < ApplicationController
  before_action :set_api

  def index
    page = params[:page] || 1
    @buildings = @api_service.buildings(page)
  end

  def favorite
    # Retornar sucesso para alterar a estrela visualmente no front
    Favorite.create(user: current_user, imovel_id: params[:building_id])
  end

  def delete_favorite
    Favorite.find(params[:id]).destroy
  end

  private

  def set_api
    @api_service = Api.new
  end
end
