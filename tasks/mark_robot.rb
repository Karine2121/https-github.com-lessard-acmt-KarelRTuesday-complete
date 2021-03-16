require_relative "../karel/ur_robot"
require_relative "../mixins/sensor_pack"


class MarkRobot < UrRobot
	include SensorPack
	attr_accessor :street, :avenue
	@max = 0

 	def initialize (street, avenue, direction, beepers, max)
		super(street, avenue, direction, INFINITY)
		@max = max
	end

	def fait_commandes(commandes)

		commandes.each do |commande|
			self.send(commande)
		end

	end

	def spiral_while(longueur)
		(1..longueur).each do |i|
			i.times do
				put_beeper
				move
			end
			turn_left
		end
	end


	def spiral(longueur=1)
		if longueur <= @max

			longueur.times do
				put_beeper
				move
			end
			turn_left

			spiral(longueur + 1)

		end
	end

end

