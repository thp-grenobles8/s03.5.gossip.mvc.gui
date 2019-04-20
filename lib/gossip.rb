require 'json'
require 'csv'

class Gossip
  attr_reader :author, :content
  @@csv = './db/gossip.csv'
  @@json = './db/gossip.json'

  def initialize (author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open(@@csv,"a") do |csv|
      csv << [@author,  @content]
    end
    puts '=> potin sauvegardé'
  end

  def self.all
    all_gossips = []
    CSV.read(@@csv).each do |row|
      # CSV.read renvoie un array
      # qui contien un array (row) par ligne du fichier
      # row[0] = author; row[1] = content
      g = Gossip.new(row[0], row[1])
      all_gossips << g
    end
    all_gossips #return
  end

  def self.delete(gossips, delete_ix)
    gossips.delete_at(delete_ix-1)
    # on supprime le gossip dans la liste
    # l'index (delete_ix) était augmenté de 1
    # pour éviter l'erreur de taper 0
    CSV.open(@@csv,"w") do |csv|
      # on ouvre en "w" pour vider le fichier existant
      csv = ""
    end
    gossips.each {
      |gossip|
      gossip.save
      # on rajoute chaque gossip qui reste
    }
  end
end
