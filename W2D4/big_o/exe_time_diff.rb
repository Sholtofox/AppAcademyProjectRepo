#O(n^2) bad 
require 'byebug'
def my_min_v1(arr)
    arr.each do |ele1|
        temp = ele1
        arr.each do |ele2|
            temp = temp < ele2 ? temp : ele2
        end
        return ele1 if temp == ele1
    end
end


#O(n) good
def my_min_v2(arr)
    min = 1.0/0 #infinity
    i  = 0
    while i < arr.count
        min = arr[i] < min ? arr[i] : min
        i += 1
    end
    min
end

#n^2 double looping
def continuous_sum_v1(arr)
    sub_arrs = [arr]
    (0...arr.length).each do |idx1|
        (idx1...arr.length).each do |idx2|
            sub_arrs << arr[idx1..idx2]
        end
    end

    get_sum(sub_arrs)
end

def get_sum(arr)
    res = arr.first.sum
    arr.each do |sub_arr|
        res = res > sub_arr.sum ? res : sub_arr.sum
    end

    res
end


def continuous_sum_v2(arr)
    total_sum, running_sum = arr.first, arr.first
    
    (1...arr.length).each do |ptr|
        running_sum += arr[ptr]
        total_sum = running_sum > total_sum ? running_sum : total_sum
        running_sum = 0 if running_sum < 0
    end
    
    total_sum
end

