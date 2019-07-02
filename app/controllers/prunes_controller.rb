class PrunesController < ApplicationController
  def new
    @prune = Prune.new
  end

  def create
    payload = filter(prune_params)
    tree = Tree.find(incoming_id(payload[:tree]))
    payload[:tree_id] = tree.id
    @prune = Prune.new(payload.except!(:tree))
    if @prune.valid? && @prune.save!
      flash[:notice] = 'poda cadastrada com sucesso!'
      redirect_to show_tree_path_url(tree.id)
    else
      flash[:notice] = 'Erro ao cadastrar poda!'
      redirect_to new_prune_path
    end
  end

  private

  def prune_params
    params.require(:prune).permit(:prune_type, :notes, :param)
  end

  def filter(prune_params)
    {
      prune_type: prune_params[:prune_type],
      notes: prune_params[:notes],
      tree: prune_params['param']
    }
  end

  def incoming_id(url)
    id = url[/\d+$/]
    id.to_i
  end
end
