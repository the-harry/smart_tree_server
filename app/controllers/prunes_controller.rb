class PrunesController < ApplicationController
  def new
    @prune = Prune.new
  end

  def create
    payload = filter(prune_params)
    tree = Tree.find_by(register: payload[:register])
    payload.tree_id = tree.id
    @prune = Prune.new(payload)
    if @prune.valid? && @prune.save!
      flash[:notice] = 'Póda cadastrada com sucesso!'
      redirect_to show_tree_path_url(@tree.id)
    else
      flash[:notice] = 'Erro ao cadastrar póda!'
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
      register: prune_params['param'][:register]
    }
  end
end
