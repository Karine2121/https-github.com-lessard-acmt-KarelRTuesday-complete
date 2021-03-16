require_relative "../karel/ur_robot"
require_relative "../mixins/sensor_pack"
require_relative "../mixins/turner"

class Selective < UrRobot
	include SensorPack
	include Turner

	def move
		if front_is_clear?
			super
		else 
			puts "non!"
		end
	end

	def move_unless
		unless !front_is_clear?
			super
		else 
			puts "non! unless"
		end
	end

	def pick_beeper
		if next_to_a_beeper?
			super
		end
	end


	def ramasse_range
		10.times do 
			pick_beeper
			move
		end
	end

	def mettre_a_2
		10.times do
			if next_to_a_beeper?
				put_beeper
			else
				put_beeper
				put_beeper
			end

			move
		end
	end

end


def task_4
  world = Robota::World
  world.read_world("../worlds/aleatoire.kwld")


  h = Selective.new(2,2,NORTH,INFINITY)
  4.times do 
  	h.mettre_a_2
  	h.turn_right
  	h.move
  	h.turn_right
  	h.mettre_a_2
  	h.turn_left
  	h.move
  	h.turn_left
  end
  h.mettre_a_2
  h.turn_off
end


def task_3
  world = Robota::World
  world.read_world("../worlds/aleatoire.kwld")


  h = Selective.new(2,2,NORTH,0)
  4.times do 
  	h.ramasse_range
  	h.turn_right
  	h.move
  	h.turn_right
  	h.ramasse_range
  	h.turn_left
  	h.move
  	h.turn_left
  end
  h.ramasse_range
  h.turn_off
end


def task
  world = Robota::World
  world.read_world("../worlds/selective")


  h = Selective.new(1,3,NORTH,INFINITY)

  h.move
  h.move
  h.move
  h.move
  h.move

  h.move_unless
  h.move_unless


end

if __FILE__ == $0
  if $graphical
     screen = window(22, 300) # (size, speed)
     screen.run do
       task_4
     end
   else
     task
   end
end

