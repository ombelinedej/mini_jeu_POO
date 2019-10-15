
class Player

	attr_accessor :name, :life_points

#__PLAYER INITIALZE_________________________________________________________________________
	def initialize(name)  #on initialize la classe player
		@name = name #attribut
		@life_points = 10 #attribut
	end

#___PLAYER LIFE STATUS___________________________________________________________________
	def show_state #méthode d'instance
	puts "#{name} has #{life_points} life points ! "
	end


#___PLAYER GETS DAMAGE___________________________________________________
	def gets_damage(number_of_dammages) #méthode d'instance
		@life_points = @life_points - number_of_dammages
	if @life_points <= 0 then puts " #{name} has been killed ! "
		end
	end


#_____COMPUTE DAMAGE____________________________________________________________________________________________
	def compute_damage 
		return rand(1..6)
	end


#_____PLAYERS ATTACKS____________________________________________________________________________________________
	def attacks(player_attacked) # the player who gets the attacks
	puts " #{name} attacks #{player_attacked.name}  "
	x = compute_damage
	gets_damage(x)
	puts  "  #{name} just gave  #{player_attacked.name} #{x} damages"
	end

#_______end___________________________________________________________________________________

end

#_______________________________________________________________________________________________________________________

#________2.0 VERSION________________________________________________________________________________________

#_______________________________________________________________________________________________________________________


class HumanPlayer < Player

	attr_accessor :weapon_level

#__PLAYER INITIALZE_________________________________________________________________________
	def initialize(name)
	@life_points = 100
	@weapon_level = 1
	end


#___PLAYER_STATUS___________________________________________________________________
	def show_state #méthode d'instance
	puts " #{name} has #{life_points}  and a weapon level #{weapon_level}"
	end

	def compute_damage
		rand(1..6) * weapon_level
	end

#___WEAPON___________________________________________________________________

	def search_weapon
		new_weapon_level = rand(1..6)
		puts " you just found a weapon level #{new_weapon_level} ! "

		if new_weapon_level > weapon_level  
		then new_weapon_level = weapon_level
		puts "Youhou ! That's a better weapon than your actual one, take it ! "
		elsif new_weapon_level <= weapon_level
		then 
		puts "Crap ! This weapon isn't any better than your actual one... "
		end
	end

#___HEALTH PACK____________________________________________________________________	
	def search_health_pack 
		health_pack =  rand(1..6)
		if health_pack = 1
		puts "Oups, there is nothing there ! "
		elsif 2 >= health_pack <= 5
		life_points = [life_points + 50, 100].min  
		puts "Congrat', you just found a 50 points pack"
		else health_pack = 6 
		life_points = [life_points + 80, 100].min 
		puts "Youhou ! You just found a 80 points pack"
		end
	end
end


#_____ENEMIES ATTACKS____________________________________________________________________________________________
	

	def gets_damage(number_of_dammages) #méthode d'instance
		@life_points = @life_points - number_of_dammages
	if @life_points <= 0 then puts " #{name} has been killed ! "
		end
	end


	def compute_damage 
		return rand(1..6)
	end


	def enemie_attacks(human_player) # the player who gets the attacks
	puts " #{name} attacks #{player_attacked.name}  "
	x = compute_damage
	gets_damage(x)
	puts  "  #{name} just gave  #{player_attacked.name} #{x} damages"
	end
