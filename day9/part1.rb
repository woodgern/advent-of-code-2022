require 'set'


Position = Struct.new(:x, :y)

input = File.readlines("input")

head = Position.new(0, 0)
tail = Position.new(0, 0)

visited = Set.new
for instruction in input
    dir, mag_str = instruction.split
    mag = mag_str.to_i

    (1..mag).each {
        case dir
        when "U"
            head.y -= 1
        when "D"
            head.y += 1
        when "L"
            head.x -= 1
        when "R"
            head.x += 1
        end

        x_delta = head.x - tail.x
        y_delta = head.y - tail.y

        if x_delta.abs == 2 && y_delta.abs == 0
            tail.x += (x_delta.abs/x_delta)
        elsif y_delta.abs == 2 && x_delta.abs == 0
            tail.y += (y_delta.abs/y_delta)
        elsif (y_delta.abs == 2 && x_delta.abs == 1) || (x_delta.abs == 2 && y_delta.abs == 1)
            tail.y += (y_delta.abs/y_delta)
            tail.x += (x_delta.abs/x_delta)
        end
        visited.add([tail.x, tail.y])
    }
end

puts visited.size
