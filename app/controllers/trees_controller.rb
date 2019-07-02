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
    #validar host
    @qr = show_tree_path_url(@tree)
  end

  private

  def tree_params
    params.require(:tree).permit(:register, :popular_name, :scientific_name,
                                 :origin, :extra_info, :near_age, :latitude,
                                 :longitude, :garden_id)
  end
end
