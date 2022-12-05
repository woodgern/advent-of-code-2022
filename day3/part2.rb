require 'set'

def is_upper?(c)
	c == c.upcase
end


input = File.readlines("input")

total_pri = 0
(0..input.length-1).step(3) do |n|

	sack1 = input[n].chars.to_set
	sack2 = input[n+1].chars.to_set
	sack3 = input[n+2].chars.to_set

	badge = (sack1 & sack2 & sack3).to_a[0]

	pri = 0
	if is_upper?(badge)
		pri = badge.ord - 38
	else
		pri = badge.ord - 96
	end
	total_pri += pri
end

puts total_pri
