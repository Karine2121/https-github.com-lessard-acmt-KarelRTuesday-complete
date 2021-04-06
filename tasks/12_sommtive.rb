$graphical = true
require_relative "../karel/ur_robot"
require_relative "../mixins/turner"
require_relative "../mixins/sensor_pack"


class RangeeRobot < UrRobot
	include Turner
	include SensorPack

	def diamonte(longueur)
		4.times do 
			fait_cote(longueur)
		end
	end

	def fait_cote(longueur)
		longueur.times do 
			put_beeper_and_move
		end
		fait_base
	end

	def put_beeper_and_move
		put_beeper
		move
		turn_right
		move
		turn_left
	end

	def fait_base
		turn_left
		move 
		move
		put_beeper
		put_beeper
		turn_around
		move
		move
		turn_around
	end

	def deplace_rangee(deplacement)
		@rangee = []
		ramasse_rangee(false)
		if deplacement > 0
			turn_right
			deplacement.times do
				move
			end
			turn_right
		else
			turn_left
			deplacement.abs.times do
				move
			end
			turn_left
		end
		depose_rangee
	end

	def ramasse_rangee(ramasse)
		10.times do
			move
			count = 0
			while next_to_a_beeper?
				pick_beeper
				count = count + 1
			end
			@rangee << count
			unless ramasse
				count.times do 
					put_beeper
				end
			end
		end
	end

	def depose_rangee
		@rangee.reverse.each do |beepers|
			beepers.times do 
				put_beeper
			end
			move
		end
		
	end

end









def task()
  world = Robota::World
  world.read_world("../worlds/rangee2.kwld")

  karel = RangeeRobot.new(1, 3, Robota::NORTH, INFINITY)

  #karel.diamonte(12)

  karel.deplace_rangee(-1)
end

if __FILE__ == $0
	if $graphical
		screen = window(30, 100) # (size, speed)
		screen.run do
			task
		end
	else
		task
	end
end