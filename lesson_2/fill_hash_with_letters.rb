# frozen_string_literal: true

# Fill the hash with letters where key is letter and value is position

abc = {}
letters = ('a'..'z').to_a
index = 0
while index < letters.length
  abc[letters[index]] = index + 1
  index += 1
end
