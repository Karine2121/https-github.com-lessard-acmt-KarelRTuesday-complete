#!/opt/local/bin/ruby
#Copyright 2012 Joseph Bergin
#License: Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License

$graphical = false

require_relative "mark_robot"

# a task for a stair sweeper
def task()
  #world = Robota::World
  #world.read_world("../worlds/stair_world.txt")


  commandes = %w[move move turn_left move move move]

  #mark = MarkRobot.new(10, 11,NORTH,0, 18) 

  #mark.fait_commandes(commandes)
  #mark.spiral

  #mark.spiral_while(18)
  
  recurse 6

  puts factorial 10
  puts factorial 10
end

def factorial n
  if n > 0
    n * (factorial n - 1)
  else
    1
  end 
end

def factorial_while n
  product = 1

  n.times do |i|
    product = product * (n - i)
  end

  product
end

def recurse(n)
  if n > 0
    recurse n-1
    puts n
  end
end


if __FILE__ == $0
  if $graphical
     screen = window(20, 200) # (size, speed)
     screen.run do
       task
     end
   else
     task
   end
end