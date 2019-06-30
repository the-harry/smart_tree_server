class TreesController < ApplicationController
  def new
    @garden = Garden.all
    @tree = Tree.new
  end

  def create
    @tree = Tree.new(tree_params)
    if @tree.valid? && @tree.save!
      flash[:notice] = 'Árvore cadastrada com sucesso!'
      redirect_to show_tree_path_url(@tree.id)
    else
      flash[:notice] = 'Erro ao cadastrar árvore!'
      redirect_to new_tree_path
    end
  end

  def all
    @trees = Tree.all
  end

  def show
    @tree = Tree.find(params[:id])
    @qr = Qrcode.new(register: @tree.register, garden: @tree.id,
                     latitude: @tree.latitude,
                     longitude: @tree.longitude).build_payload
  end

  def lookup
    @tree = Tree.find_by(register: search_params['register'])

    unless @tree.blank?
      redirect_to @tree
    else
      flash[:notice] = "Qr code não identificado."
      redirect_to search_garden_path
    end
  end

  private

  def tree_params
    params.require(:tree).permit(:register, :popular_name, :scientific_name,
                                 :origin, :extra_info, :near_age, :latitude,
                                 :longitude, :garden_id)
  end

  def search_params
    params.permit(:param)
  end
end
