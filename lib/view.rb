class View
  def initialize
    #
  end

  def create_gossip
    puts 'Quel est le ragot ?'
    print '>>'
    content = gets.chomp.to_s
    puts 'QUI A DIT CA ?'
    print '>>'
    author = gets.chomp.to_s
    {:author => author, :content => content}
  end

  def index_gossips (gossips)
    gossips.each { |gossip|
      puts "pssst ... #{gossip.author} a dit #{gossip.content} !"
    }
    puts "=> fin des gossips"
  end

  def delete_gossip (gossips)
    if gossips.length < 1
      puts "il n'y a pas de potin a supprimer ..."
      return false
      # pas de suppression s'il n'y a pas de gossip ...
    end
    puts "Voici les potins du jour :"
    gossips.each_with_index { |gossip, index|
      # each with index envoie la valeur + son index (à partir de 0)
      puts "#{index+1} - #{gossip.author} a dit #{gossip.content} !"
    }
    delete_ix = nil
    until (1..gossips.length).to_a.include?(delete_ix)
      puts "Indique l'index de celui que tu veux supprimer"
      print '>>'
      delete_ix = gets.chomp.to_i
    end
    delete_ix # return
  end
end
