
arr = []

9000.times do 
	arr << rand(1..100)
end


len =  arr.length

# puts arr
start = Time.now
i = 0
j = 1
tmp = 0

while i < len -1
	j = i+1
	plus_petit = i
	while j < (len)
		if arr[plus_petit] > arr[j]
			plus_petit = j
		end
		j = j + 1
	end
	tmp = arr[i]
	arr[i] = arr[plus_petit]
	arr[plus_petit] = tmp

	i = i+1
end


# puts "----------------------------------"
# puts "----------------------------------"

# puts arr

finish = Time.now
diff = finish - start

puts diff
