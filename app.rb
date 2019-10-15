require "pry"
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "This is the state of the 2 players"

puts player1.show_state
puts player2.show_state


puts "Let's fight ! " 


	while player1.life_points > 0 && player2.life_points > 0 do
		player1.attacks(player2)
				player2.attacks(player1)


		if player2.life_points <= 0 
		break
		elsif 	player1.life_points <= 0
		break
		end
		puts "This is the state of the 2 players"
		puts player1.show_state
		puts player2.show_state


	end 

binding.pry
