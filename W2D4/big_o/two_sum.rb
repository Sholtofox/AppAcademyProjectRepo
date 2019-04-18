#brute force
require 'byebug'
def bad_two_sum(arr, target_sum)
    (0...arr.length).each do |idx1|       
        ((idx1 + 1)...arr.length).each do |idx2|       
            return true if arr[idx1] + arr[idx2] == target_sum
        end
    end
    false
end

arr = [0, 1, 5, 7]
# p bad_two_sum(arr, 6) # => should be true
# p bad_two_sum(arr, 10) # => should be false

class Array
    def bsearch(target)
        return nil if self.empty?
        mid = self.length/2

        case self[mid] <=> target
            when 0 
                return mid
            when 1
                return self.take(mid).bsearch(target)
            else
                search_rest = self.drop(mid + 1).bsearch(target) 
                return search_rest.nil? ?  nil : search_rest + mid + 1
        end
    end
end


def okay_two_sum(arr, target_sum)
    sorted_arr = arr.sort
    sorted_arr.each_with_index do |ele, idx|
        temp = target_sum - ele
        return true if sorted_arr.drop(idx+1).bsearch(temp)
    end
    
    false
end

require 'set'

def two_sum?(arr, target_sum)
    set = Set.new
    arr.each do |ele|
        return true if set.include?(ele)
        expected_ele = target_sum - ele
        set.add(expected_ele)
    end
    false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false