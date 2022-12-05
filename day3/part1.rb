require 'set'

def is_upper?(c)
	c == c.upcase
end


input = File.readlines("input")

total_pri = 0
for rucksack in input

	compartment1 = rucksack.strip[0..(rucksack.length/2)-1].chars.to_set
	compartment2 = rucksack.strip[rucksack.length/2..rucksack.length].chars.to_set

	item = (compartment1 & compartment2).to_a[0]

	pri = 0
	if is_upper?(item)
		pri = item.ord - 38
	else
		pri = item.ord - 96
	end
	total_pri += pri
end

puts total_pri
