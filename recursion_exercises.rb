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


#p iter_fib(1)
#p iter_fib(3)
#p iter_fib(7)



def bsearch(array, target)
    return nil if array.length == 0
    if array.length == 1
        return nil if array[0] != target
        return 0
    end
    middle_index = array.length / 2
    mid_ele = array[middle_index]
    if target < mid_ele
        bsearch(array[0...middle_index], target)
    elsif target == mid_ele
        middle_index
    else
        return nil if bsearch(array[middle_index+1..-1], target) == nil
        bsearch(array[middle_index+1..-1], target) + middle_index + 1
    end
end

#p bsearch([1, 2, 3], 1) # => 0
#p bsearch([2, 3, 4, 5], 3) # => 1
#p bsearch([2, 4, 6, 8, 10], 6) # => 2
#p bsearch([1, 3, 4, 5, 9], 5) # => 3
#p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
#p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
#p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


def merge_sort(array)
    return array if array.length < 2
    mid_index = array.length / 2
    left = merge_sort(array[0...mid_index])
    right = merge_sort(array[mid_index..-1])
    merge(left,right)
end

def merge(left,right)
    new_arr = []
    while left.length > 0 && right.length > 0
        if left[0] > right[0]
            new_arr << right[0]
            right = right[1..-1]
        else
            new_arr << left[0]
            left = left[1..-1]
        end
    end
    new_arr + left + right
end

arr1 = [1,5,7,2,4,10]
arr2 = []
arr3 = [5,4,3,1,2]

# p merge_sort(arr1)
# p merge_sort(arr2)
# p merge_sort(arr3)

# p merge(arr1, arr3)

def subsets(arr)
    return [[]] if arr.length == 0
    subs = subsets(arr[1..-1])
    new_subs = []

    subs.each do |el|
        new_subs << el + [arr[0]]
    end
    subs + new_subs
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]



