input = File.readlines("input")

total_score = 0
for round in input
	opp, mine = round.split

	score = 0
	if opp == "A" && mine == "Y"
		score += 6
	elsif opp == "B" && mine == "Z"
		score += 6
	elsif opp == "C" && mine == "X"
		score += 6
	elsif opp == "A" && mine == "X" 
		score += 3
	elsif opp == "B" && mine == "Y"
		score += 3
	elsif opp == "C" && mine == "Z"
		score += 3
	end

	case mine
	when "X"
	  	score += 1
	when "Y"
	  	score += 2
	when "Z"
	 	score += 3
	end
	total_score += score
end

puts total_score
