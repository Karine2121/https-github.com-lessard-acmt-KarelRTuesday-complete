

def tri_bulles(matrice)

	len =  matrice.length

	i = 0
	j = 1
	tmp = 0

	while i < len
		j = 1
		while j < (len - i)
			if matrice[j-1] > matrice[j]
				tmp = matrice[j]
				matrice[j] = matrice[j-1]
				matrice[j-1] = tmp
			end
			j = j + 1
		end

		i = i+1
	end


	return matrice
end


def tri_selection(matrice)

	len =  matrice.length

	i = 0
	j = 1
	tmp = 0

	while i < len -1
		j = i+1
		plus_petit = i
		while j < (len)
			if matrice[plus_petit] > matrice[j]
				plus_petit = j
			end
			j = j + 1
		end
		tmp = matrice[i]
		matrice[i] = matrice[plus_petit]
		matrice[plus_petit] = tmp

		i = i+1
	end

	return matrice

end


def tri_fusion(matrice)

	num_elements = matrice.length
	if num_elements <= 1
	  return matrice
	end

	half_of_elements = (num_elements / 2).round

	left  = matrice.take(half_of_elements)
	right = matrice.drop(half_of_elements)

	sorted_left = tri_fusion(left)
	sorted_right = tri_fusion(right)

	merge(sorted_left, sorted_right)
end

def merge(left_array, right_array)
	if right_array.empty?
	  return left_array
	end

	if left_array.empty?
	  return right_array
	end

	smallest_number = if left_array.first <= right_array.first
	  left_array.shift
	else
	  right_array.shift
	end

	recursive = merge(left_array, right_array)

	[smallest_number].concat(recursive)
end



arr = []

9.times do 
	arr << rand(1..100)
end


puts tri_bulles(arr)
puts "tri_bulles"
puts "_______________"
puts tri_selection(arr)
puts "tri_selection"
puts "_______________"
puts tri_fusion(arr)
puts "fusion"
puts "_______________"
