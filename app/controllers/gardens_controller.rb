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
    @qr = Qrcode.new(garden: @garden.host, latitude: @garden.latitude,
                     longitude: @garden.longitude).build_payload
  end

  def search; end

  def lookup
    puts 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
    puts search_params
    puts 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'

    @garden = Garden.find_by(host: search_params['garden'],
                             latitude: search_params['latitude'],
                             longitude: search_params['longitude'])
    unless @garden.blank?
      redirect_to @garden
    else
      flash[:notice] = "Qr code não identificado."
      redirect_to search_garden_path
    end
  end

  private

  def garden_params
    params.require(:garden).permit(:host, :latitude, :longitude)
  end

  def search_params
    params.permit(:param)
  end
end
