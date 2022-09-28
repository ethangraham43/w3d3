def range(start,last)
    return [] if start >= last
    #new_array = (start...last).map { |n| n } #iterative
    new_array = [start]
    new_array += range(start + 1, last)
end

#p range(3,7)
#p range(5,9)
#p range(9,15)
#p range(9,8)


def exp(base, num)
    return 1 if num == 0
    base * exp(base, num - 1)
end

#p exp(2,3)
#p exp(5,0)
#p exp(3,7)

def exp2(base, num)
    return 1 if num == 0
    return base if num == 1
    if num % 2 == 0
        exp2(base, num/2) * exp2(base, num/2)
    else
        exp2(base, num/2) * exp2(base, num/2 + 1)
    end
end

# p exp2(2,3)
# p exp2(5,0)
# p exp2(3,7)

def deep_dup(arg)
    return arg if !arg.is_a?(Array)
    new_arr = []
    arg.each do |el|
        new_arr << deep_dup(el)
    end
    return new_arr
end

# p deep_dup([1, [2], [3, [4]]])

# arr1 = [1, [2], [3, [4]]]
# arr2 = deep_dup(arr1)
# p arr1.object_id
# p arr2.object_id
# p arr1[2].object_id
# p arr2[2].object_id

def rec_fib(n)
    return [1] if n == 1
    return [1, 1] if n == 2
    previous = rec_fib(n-1)

    previous << previous[-1] + previous[-2]
end

# p rec_fib(1)
# p rec_fib(3)
# p rec_fib(7)

def iter_fib(n)
    arr = []
    (1..n).each do |i|
        if i == 1 || i == 2
            arr << 1
        else
            arr << arr[-1] + arr[-2]
        end
    end
    arr
end


p iter_fib(1)
p iter_fib(3)
p iter_fib(7)