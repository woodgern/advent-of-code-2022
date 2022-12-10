require 'set'


Position = Struct.new(:x, :y)

input = File.readlines("input")

# head is 0, tail is 9
knots = Array.new(10) { Position.new(0, 0) }

visited = Set.new
for instruction in input
    dir, mag_str = instruction.split
    mag = mag_str.to_i

    (1..mag).each {
        case dir
        when "U"
            knots[0].y -= 1
        when "D"
            knots[0].y += 1
        when "L"
            knots[0].x -= 1
        when "R"
            knots[0].x += 1
        end

        for knot_ind in (1..9)
            follower = knots[knot_ind]
            leader = knots[knot_ind-1]

            x_delta = leader.x - follower.x
            y_delta = leader.y - follower.y

            if x_delta.abs == 2 && y_delta.abs == 0
                follower.x += (x_delta.abs/x_delta)
            elsif y_delta.abs == 2 && x_delta.abs == 0
                follower.y += (y_delta.abs/y_delta)
            elsif (y_delta.abs == 2 && x_delta.abs == 1) || (x_delta.abs == 2 && y_delta.abs == 1) || (y_delta.abs == 2 && x_delta.abs == 2)
                follower.y += (y_delta.abs/y_delta)
                follower.x += (x_delta.abs/x_delta)
            end
            if knot_ind == 9
                visited.add([follower.x, follower.y])
            end
        end
    }
end

puts visited.size
