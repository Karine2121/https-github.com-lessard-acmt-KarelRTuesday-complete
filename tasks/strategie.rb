$graphical = true
require_relative "../karel/ur_robot"


class RunnerRobot < UrRobot
	@runner_strategy = nil
	def initialize(street,avenue, direction, beepers)
		super(street,avenue, direction, beepers)
		@runner_strategy = NullStrategie.new()
	end
	def set_strategy(strategy)
		@runner_strategy = strategy
	end
	def courir
		@runner_strategy.courir(self)
	end

end

class Strategie
	def courir(robot)
		raise NotImplementedError.new(“Strategie pas implémenté”)
	end
end		
class NullStrategie < Strategie
	def courir(robot)
		#rien!
	end
end	
class DeuxBlocStrategie < Strategie
	def courir(robot)
		2.times do 
			robot.move
			robot.put_beeper
		end
	end
end			
class TroisBlocStrategie < Strategie
	def courir(robot)
		3.times do 
			robot.move
			robot.put_beeper
		end
	end
end		


def task()
  world = Robota::World
  world.read_world("../worlds/jade")
  
  karel = RunnerRobot.new(1, 1, Robota::EAST, 0)
  karel.set_strategy(DeuxBlocStrategie.new)

  karel.courir
  
end

if __FILE__ == $0
  if $graphical
     screen = window(8, 40) # (size, speed)
     screen.run do
       task
     end
   else
     task
   end
end