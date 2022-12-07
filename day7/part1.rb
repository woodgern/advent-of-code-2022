
Directory = Struct.new(:name, :children, :parent, :size)
File_ = Struct.new(:name, :size)


def sum_filesystem(dir)
    case dir
    when Directory
        sum = 0
        dir.children.each { |_, v|
            sum += sum_filesystem(v)
        }
        sum += dir.size if dir.size <= 100000
        return sum
    when File_
        return 0
    end
end

def compute_directory_sizes(dir)
    sum = 0
    dir.children.each { |_, v|
        case v
        when Directory
            compute_directory_sizes(v)
        end
        sum += v.size
    }
    dir.size = sum
end


input = File.readlines("input")[1..-1]

root = Directory.new("/", {}, nil, 0)

pwd = root
for line in input
    case line.chars.first
    when "$"
        case line[2..3]
        when "cd"
            case line.split[2]
            when "/"
                pwd = root
            when ".."
                pwd = pwd.parent
            else
                pwd = pwd.children[line.split[2]]
            end
        when "ls"
        end
    when "d"
        name = line.split[1]
        pwd.children[name] = Directory.new(name, {}, pwd, 0)
    else
        size, name = line.split
        pwd.children[name] = File_.new(name, size.to_i)
    end
end

compute_directory_sizes(root)

puts sum_filesystem(root)
