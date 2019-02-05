def encode(plaintext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  ciphertext_chars = plaintext.chars.map do |char|
#one of the characters in ciper is missing and cannot be found from char in plaintext
#to solve just remove the extra dot in 'a'...'z' as this notation excludes z from the array
    (65 + cipher.find_index(char)).chr #here is the line with the error - there is a nil value that cannot be encoded
  end
  ciphertext_chars.join
end

def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars) #same problem
  plaintext_chars = ciphertext.chars.map do |char|
    cipher[65 - char.ord] # notation for encoding is incorrect
  end
  plaintext_chars.join
end

encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
#
decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# => "theswiftfoxjumpedoverthelazydog"
