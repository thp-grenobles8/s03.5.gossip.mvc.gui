require 'view'
require 'gossip'

class Controller
  def initialize
    @view = View.new
  end

  def create_gossip
    params = @view.create_gossip
    gossip = Gossip.new(params[:author], params[:content])
    gossip.save
  end

  def index_gossips
    all_gossips = Gossip.all
    @view.index_gossips(all_gossips)
  end

  def delete_gossip
    all_gossips = Gossip.all
    delete_ix = @view.delete_gossip(all_gossips)
    if delete_ix != false #s'il y a bien un gossip a supprimer
      Gossip.delete(all_gossips, delete_ix)
      # on repasse par le model pour supprimer le gossip
    end
  end
end
