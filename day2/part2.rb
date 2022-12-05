input = File.readlines("input")

total_score = 0
for round in input
	opp, result = round.split
	mine = nil

	if opp == "A" && result == "X"
		mine = "C"
	elsif opp == "B" && result == "X"
		mine = "A"
	elsif opp == "C" && result == "X"
		mine = "B"
	elsif opp == "A" && result == "Y" 
		mine = "A"
	elsif opp == "B" && result == "Y"
		mine = "B"
	elsif opp == "C" && result == "Y"
		mine = "C"
	elsif opp == "A" && result == "Z" 
		mine = "B"
	elsif opp == "B" && result == "Z"
		mine = "C"
	elsif opp == "C" && result == "Z"
		mine = "A"
	end

	score = 0
	case result
	when "Y"
		score += 3
	when "Z"
		score += 6
	end

	case mine
	when "A"
	  	score += 1
	when "B"
	  	score += 2
	when "C"
	 	score += 3
	end
	total_score += score
end

puts total_score
