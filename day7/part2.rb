
Directory = Struct.new(:name, :children, :parent, :size)
File_ = Struct.new(:name, :size)

FILESYSTEM_SIZE = 70000000
REQUIRED_SPACE = 30000000


def find_smallest_directory_of_at_least_size(dir, target_size)
    case dir
    when Directory
        if dir.size >= target_size
            smallest = dir.size
            dir.children.each { |_, v|
                size = find_smallest_directory_of_at_least_size(v, target_size)
                if size != nil && size < smallest && size >= target_size
                    smallest = size
                end
            }
            return smallest
        end
        return nil
    when File_
        return nil
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

target_size = REQUIRED_SPACE - (FILESYSTEM_SIZE - root.size)

puts find_smallest_directory_of_at_least_size(root, target_size)
