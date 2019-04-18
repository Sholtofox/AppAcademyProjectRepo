def permutate_str(string)
    return [""] if string.empty?
    arr = []
    string.each_char.with_index do |char, idx|
        permutate_str(string[0...idx] + string[idx+1..-1]).each do |ele|
            arr << char + ele
        end
    end
    arr 
end

def first_anagram?(str1, str2)
    permutate_strs = permutate_str(str1)
    permutate_strs.include? str2
end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2)
    str1.each_char do |char|
        index = str2.index(char)
        str2[index] = "" if index
    end
    str2.empty?
end

p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true


def third_anagram?(str1, str2)
    str1.chars.sort == str2.chars.sort
end

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(str1, str2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)

    str1.each_char{|char| hash1[char] += 1}
    str2.each_char{|char| hash2[char] += 1}
    hash1 == hash2
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true

def fourth_anagram_better?(str1, str2)
    hash = Hash.new(0)

    str1.each_char{|char| hash[char] += 1}
    str2.each_char{|char| hash[char] -= 1}
    
    hash.values.all?{|ele| ele == 0}
end

p fourth_anagram_better?("gizmo", "sally")    #=> false
p fourth_anagram_better?("elvis", "lives")    #=> true