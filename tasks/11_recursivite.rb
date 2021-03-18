require 'byebug'

def pgdc(n1, n2)
	#byebug
	if (n2 == 0) 
		n1
	else 
		pgdc(n2, n1 % n2)
	end
end


#puts pgdc(1000, 835)


def recurse(nn)
byebug
	unless (nn==0)
		recurse(nn-1)
		puts nn
	end
end

#ecurse 10


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

puts factorial (5)