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

p exp2(2,3)
p exp2(5,0)
p exp2(3,7)