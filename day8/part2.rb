input = File.readlines("input")

forest = []
for line in input
    forest.append([])
    for c in line.strip.chars
        forest.last.append(c.to_i)
    end
end

most_scenic = 0
(0..forest.length-1).each { |i|
    (0..forest[0].length-1).each { |j|
        dist1 = 1
        (1..j).each { |k|
            if j-k-1 < 0
                break
            end
            if forest[i][j-k] >= forest[i][j]
                break
            end
            dist1 += 1
        }
        dist2 = 1
        (1..forest.length-1-j).each { |k|
            if j+k+1 >= forest.length
                break
            end
            if forest[i][j+k] >= forest[i][j]
                break
            end
            dist2 += 1
        }
        dist3 = 1
        (1..i).each { |k|
            if i-k-1 < 0
                break
            end
            if forest[i-k][j] >= forest[i][j]
                break
            end
            dist3 += 1
        }
        dist4 = 1
        (1..forest.length-1-i).each { |k|
            if i+k+1 >= forest.length
                break
            end
            if forest[i+k][j] >= forest[i][j]
                break
            end
            dist4 += 1
        }
        score = dist4 * dist3 * dist2 * dist1
        if score > most_scenic
            most_scenic = score
        end
    }
}

puts most_scenic
