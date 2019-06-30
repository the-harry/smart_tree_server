class GardensController < ApplicationController
  def new
    @garden = Garden.new(garden_params)
  end

  def create
    @garden = Garden.new
    if @garden.save!
      flash[:notice] = 'Jardim criado com sucesso!'
    else
      flash[:notice] = 'Erro ao criar jardim!'
    end
    redirect_to @garden
  end

  def show
    @garden = Garden.all
  end

  private

  def garden_params
    params.permit(:host, :latitude, :longitude)
  end
end
