
def is_alpha?(c)
  !c.match(/\A[a-zA-Z]*\z/).nil?
end

input = File.readlines("input")

raw_stacks = []
procedure = []

parsing_stacks = true
for line in input
	if line.strip.length == 0
		parsing_stacks = false
		next
	end

	if parsing_stacks
		raw_stacks.append(line)
	else
		procedure.append(line)
	end
end

stack_count = raw_stacks.last.strip[-1].to_i
stacks = Array.new(stack_count) { [] }

for layer in raw_stacks[0..-2]
	ind = 0
	for c in layer.chars
		if is_alpha?(c)
			stack_num = ((ind + 3) / 4) - 1
			stacks[stack_num].prepend(c)
		end
		ind += 1
	end
end

for instruction in procedure
	instr_arr = instruction.split
	num = instr_arr[1].to_i
	origin_stack = instr_arr[3].to_i
	destination_stack = instr_arr[5].to_i

	(1..num).each {
		crate = stacks[origin_stack-1].pop
		if crate != nil
			stacks[destination_stack-1].push(crate)
		end
	}
end

stack_string = ""
for stack in stacks
	if stack.last
		stack_string += stack.last
	end
end

puts stack_string
