Tree = Struct.new(:height, :visible)

input = File.readlines("input")

forest = []
for line in input
    forest.append([])
    for c in line.strip.chars
        forest.last.append(Tree.new(c.to_i, false))
    end
end

(0..forest.length-1).each { |i|
    tallest_left = -1
    tallest_up = -1
    (0..forest[0].length-1).each { |j|
        if forest[i][j].height > tallest_left
            tallest_left = forest[i][j].height
            forest[i][j].visible = true
        end

        if forest[j][i].height > tallest_up
            tallest_up = forest[j][i].height
            forest[j][i].visible = true
        end
    }
}

(0..forest.length-1).reverse_each { |i|
    tallest_right = -1
    tallest_down = -1
    (0..forest[0].length-1).reverse_each { |j|
        if forest[i][j].height > tallest_right
            tallest_right = forest[i][j].height
            forest[i][j].visible = true
        end

        if forest[j][i].height > tallest_down
            tallest_down = forest[j][i].height
            forest[j][i].visible = true
        end
    }
}

total = 0
for row in forest
    for tree in row
        if tree.visible
            total += 1
        end
    end
end

puts total
