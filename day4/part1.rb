
def is_subset?(range1, range2)
	min1, max1 = range1.split("-").map { |s| s.to_i }
	min2, max2 = range2.split("-").map { |s| s.to_i }

	return min1 >= min2 && max1 <= max2
end


input = File.readlines("input")

total_proper_subsets = 0
for pair in input
	range1, range2 = pair.split(",")

	if is_subset?(range1, range2) || is_subset?(range2, range1)
		total_proper_subsets += 1
	end
end

puts total_proper_subsets
