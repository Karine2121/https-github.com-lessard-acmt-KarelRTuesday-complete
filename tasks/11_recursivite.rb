require 'byebug'

def pgdc(n1, n2)
	#byebug
	if (n2 == 0) 
		n1
	else 
		pgdc(n2, n1 % n2)
	end
end


puts pgdc(1000, 835)