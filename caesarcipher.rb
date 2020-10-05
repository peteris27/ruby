def caesar_cipher(string, key)
  alphabet_lower = ('a'..'z').to_a
  new_string = ""
  string.each_char do |letter|

    if (alphabet_lower).include? (letter.downcase)
      key.times {letter = letter.next}
  end
  new_string << letter[-1]
end
  return new_string
end

string = "WhAt A stRing!"
key = 5

puts caesar_cipher(string, key)
