$graphical = true
require_relative "../karel/ur_robot"

class RangeeRobot < UrRobot
	@runner_strategy = nil
	def initialize(street,avenue, direction, beepers)
		super(street,avenue, direction, beepers)
		@runner_strategy = UnBeeperStrategie.new()
	end

	def set_strategy(strategy)
		@runner_strategy = strategy
	end
	
	def mettre_rangee
		@runner_strategy.mettre_rangee(self)
	end
end

class Strategie
	def mettre_rangee(robot)
		raise NotImplementedError.new(“Strategie pas implémenté”)
	end
end		

class UnBeeperStrategie < Strategie
	def mettre_rangee(robot)
		10.times do
			robot.move
		end
		#rien!
	end
end	

class DeuxBeeperStrategie < Strategie
	def mettre_rangee(robot)
		10.times do 
			2.times do 
				robot.put_beeper
			end
			robot.move
		end
	end
end		

class TroisBeeperStrategie < Strategie
	def mettre_rangee(robot)
		10.times do
			3.times do 
				robot.put_beeper
			end
			robot.move
		end
	end
end		


def task()
  world = Robota::World
  
  karel = RangeeRobot.new(1, 1, Robota::NORTH, INFINITY)
  karel2 = RangeeRobot.new(1, 2, Robota::NORTH, INFINITY)
  karel3 = RangeeRobot.new(1, 3, Robota::NORTH, INFINITY)

  karel.set_strategy(UnBeeperStrategie.new)
  karel2.set_strategy(DeuxBeeperStrategie.new)
  karel3.set_strategy(TroisBeeperStrategie.new)

  karel.mettre_rangee
  karel2.mettre_rangee
  karel3.mettre_rangee
  
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