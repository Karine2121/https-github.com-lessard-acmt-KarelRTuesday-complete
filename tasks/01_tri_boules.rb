
arr = []

9000.times do 
	arr << rand(1..100)
end


len =  arr.length

# puts arr

i = 0
j = 1
tmp = 0


start = Time.now
# code to time


while i < len
	j = 1
	while j < (len - i)
		if arr[j-1] > arr[j]
			tmp = arr[j]
			arr[j] = arr[j-1]
			arr[j-1] = tmp
		end
		j = j + 1
	end

	i = i+1
end

finish = Time.now
diff = finish - start

puts diff


# puts "----------------------------------"
# puts "----------------------------------"

# puts arr