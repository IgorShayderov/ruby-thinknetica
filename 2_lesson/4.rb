letters = {}

("a".."z").each{|letter|
  if letter == "a"
    letters[letter] = 1
  elsif letter == "e"
    letters[letter] = 5
  elsif letter == "i"
    letters[letter] = 9
  elsif letter == "o"
    letters[letter] = 15
  elsif letter == "u"
    letters[letter] = 21
  end
}

puts letters