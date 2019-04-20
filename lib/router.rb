require 'controller'
require 'pry'

class Router
  def initialize
    @controller = Controller.new
  end

  def perform
    puts "//// BIENVENUE dans po-po-po potins \\\\\\\\"

    while true
      puts ''
      puts "Que veux tu faire ?"
      puts "1 - créer un potin"
      puts "2 - voir les potins existants"
      puts "3 - supprimer un potin"
      puts "4 - partir de popopoPotins"
      print '>>'
      choice = gets.chomp.to_i

      case choice
      when 1
        puts "=> créons un potin"
        @controller.create_gossip
      when 2
        puts "=> voyons voir ce qu'il se dit"
        @controller.index_gossips
      when 3
        puts "=> supprimons un potin"
        @controller.delete_gossip
      when 4
        puts "=> au revoir !"
        break
      else
        puts "=> je n'ai pas compris ..."
      end
    end
  end
end
