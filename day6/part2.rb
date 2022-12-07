require 'set'


def all_unique?(str)
    return str.length == str.chars.to_set.size
end


buffer = File.readlines("input")[0]

ind = 14
last_fourteen = buffer[0..13]
for c in buffer[14..-1].chars
    last_fourteen += c
    if all_unique?(last_fourteen)
        puts ind
        break
    end
    last_fourteen = last_fourteen[1..-1]
    ind += 1
end
