class GardensController < ApplicationController
  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(garden_params)
    if @garden.valid? && @garden.save!
      flash[:notice] = 'Jardim criado com sucesso!'
      redirect_to show_garden_path_url(@garden.id)
    else
      flash[:notice] = 'Erro ao criar jardim!'
      redirect_to new_garden_path
    end
  end

  def all
    @garden = Garden.all
  end

  def show
    @garden = Garden.find(params[:id])
    # validar host
    @qr = show_garden_path_url(@garden)
  end

  private

  def garden_params
    params.require(:garden).permit(:host, :latitude, :longitude)
  end
end
