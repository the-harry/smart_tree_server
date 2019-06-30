class GardensController < ApplicationController
  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(garden_params)
    if @garden.valid? && @garden.save!
      flash[:notice] = 'Jardim criado com sucesso!'
      redirect_to garden_path
    else
      flash[:notice] = 'Erro ao criar jardim!'
      redirect_to new_garden_path
    end
  end

  def show
    @garden = Garden.all
  end

  private

  def garden_params
    params.permit(:host, :latitude, :longitude)
  end
end
