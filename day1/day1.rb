input = File.readlines("input")

elf_totals = []

current_total = 0
for item in input
	if item.length > 1
		current_total += item.to_i
	else
		elf_totals.append(current_total)
		current_total = 0
	end
end
elf_totals.append(current_total)

puts elf_totals.max

puts elf_totals.max(3).sum