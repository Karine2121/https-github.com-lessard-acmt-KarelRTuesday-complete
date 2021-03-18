#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = true

require_relative "../karel/ur_robot"



class MonRobot < UrRobot

  attr_accessor :street, :avenue

end


# a task for a stair sweeper
def task()
  world = Robota::World
  #world.read_world("../worlds/monde")
  
  karel = MonRobot.new(1, 1, Robota::NORTH, 0)
  5.times do 
    karel.move
  end

  karel2 = MonRobot.new(karel.street, karel.avenue, EAST, 0)

  karel2.move
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