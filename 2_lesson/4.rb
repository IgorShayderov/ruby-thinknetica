vowels = {}

("a".."z").each.with_index(1) do |letter, index|
vowels[letter] = index if 'aeiou'.include?(letter)
end

puts vowels