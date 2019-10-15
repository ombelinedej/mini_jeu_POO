require "pry"

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#___ACCUEIL_____________________________________________
puts "
 ---------------------------------------------------
| 			WELCOME IN POO GAME!   |
| The goal is to be the LAST SURVIVOR ! GOOD LUCK !    |
 ---------------------------------------------------
 "



#___PLAYER INITIALIZATION_____________________________________________
puts "What's you name ?"
name = gets.chomp
human_player = HumanPlayer.new(name)


#___ENEMIES_____________________________________________

Josiane = Player.new("Josiane")
José = Player.new("José")

enemies_array = [Josiane, José]


#___FIGHTS____________________________________________
#__boucle while start______
while (José.life_points > 0 && Josiane.life_points > 0) || human_player.life_points > 0 
	puts "This is the state of the human player"
	puts  human_player.show_state



	#___MENU_PLAYER DECISION ___________________________________________
	puts "You have #{human_player.life_points} life points left, what do you wan to do ?"
	puts "","a - find a new weapon","s - find a health pack"
	puts "", "attack a enemies player:"
	puts "","0 - Josiane has #{Josiane.life_points} life points","1 - José has #{José.life_points} life points"

	human_player_decision = gets.chomp
	puts ""
	gets.chomp


	#___________PLAYER DECISION ___________________________________________
	if   human_player_decision == "a"
	human_player.search_weapon
	gets.chomp
	elsif   human_player_decision == "s"
	human_player.search_health_pack
	gets.chomp
	elsif   human_player_decision == "0"
	human_player.attacks(Josiane)
	gets.chomp
	elsif   human_player_decision == "1"
	human_player.attacks(José)
	gets.chomp
	end

	puts "","-----",""




	#___FIGHT BACK___________________________________________
	if enemies_array.all? {|enemies| enemies.life_points < 1} == true
	puts "END OF THE GAME, YOU WIN !!! "  #if other players don't have life point, the game is over, human player wins
	else 
	puts "OMG OTHER ENEMIES ARE ATTACKING !"  #otherwise, the player attack the human player
	enemies_array.each {|enemies| # each player with life point attack HumanPlayer
		if enemies.life_points > 0
		  puts ""
		  enemies.enemie_attacks(human_player)
		end
	}
	end
	# if HumanPlayer don't have life point anymore, game is over
	if human_player.life_points <= 0
	puts " #{HumaPlayer.name} has been killed, GAME OVER,  :( "
	end
end
#__boucle while end______________________________________________




#___END GAME____________________________________________

		#if HumanPlayer.life_points > 0 
		#puts " CONGRAT YOU WIN !!!!"
		#else HumanPlayer.life_points <= 0 
		#puts "GAME OVER, YOU LOSE"
		#puts player1.show_state
		#puts player2.show_state



binding.pry

