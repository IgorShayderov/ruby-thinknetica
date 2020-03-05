vowels = {}

("a".."z").each.with_index(1){|letter, index|
  if letter == "a"
    vowels[letter] = index
  elsif letter == "e"
    vowels[letter] = index
  elsif letter == "i"
    vowels[letter] = index
  elsif letter == "o"
    vowels[letter] = index
  elsif letter == "u"
    vowels[letter] = index
  end
}

puts vowels