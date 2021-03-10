require_relative "../karel/ur_robot"
require_relative "../mixins/turner"

class HEcrivian < UrRobot
	include Turner
	def ecrit_lettre
		put_beeper
		move
		put_beeper
		move
		put_beeper
		move
		put_beeper
		move
		put_beeper
		turn_right
		move
		turn_right
		move
		move
		put_beeper
		turn_left
		move
		put_beeper
		turn_left
		move
		move
		turn_around
		put_beeper
		move
		put_beeper
		move
		move
		put_beeper
		move
		put_beeper
		turn_off
	end

end

class EEcrivian < UrRobot
	include Turner
	def ecrit_lettre
		put_beeper
		move
		put_beeper
		move
		put_beeper
		move
		put_beeper
		move
		put_beeper
		turn_right
		move
		put_beeper
		turn_right
		move
		move
		put_beeper
		move
		move
		put_beeper
		turn_left
		move
		turn_left
		put_beeper
		move
		move
		put_beeper
		move
		move
		put_beeper
		turn_off
	end

end

class LEcrivian < UrRobot
	include Turner
	def ecrit_lettre
		put_beeper
		move
		put_beeper
		move
		put_beeper
		move
		put_beeper
		move
		put_beeper
		turn_around
		move
		move
		move
		move
		turn_left
		move
		put_beeper
		move
		put_beeper
		turn_off
	end

end

class OEcrivian < UrRobot
	include Turner

	def ecrit_lettre
		put_beeper
		move
		put_beeper
		move
		put_beeper
		move
		put_beeper
		move
		put_beeper
		turn_right
		move
		put_beeper
		move
		turn_right
		put_beeper
		move
		put_beeper
		move
		put_beeper
		move
		put_beeper
		move
		put_beeper
		turn_right
		move
		put_beeper
		move
		turn_off
	end
end

def task
	h = HEcrivian.new(3,2,NORTH,INFINITY)
	h.ecrit_lettre
	e = EEcrivian.new(3,6,NORTH,INFINITY)
	e.ecrit_lettre
	l = LEcrivian.new(3,10,NORTH,INFINITY)
	l.ecrit_lettre
	l = LEcrivian.new(3,14,NORTH,INFINITY)
	l.ecrit_lettre
	o = OEcrivian.new(3,18,NORTH,INFINITY)
	o.ecrit_lettre
end

if __FILE__ == $0
  if $graphical
     screen = window(22, 200) # (size, speed)
     screen.run do
       task
     end
   else
     task
   end
end

