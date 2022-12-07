require 'set'


def all_unique?(str)
    return str.length == str.chars.to_set.size
end


buffer = File.readlines("input")[0]

ind = 4
last_four = buffer[0..2]
for c in buffer[3..-1].chars
    last_four += c
    if all_unique?(last_four)
        puts ind
        break
    end
    last_four = last_four[1..-1]
    ind += 1
end
