puts "Please enter some text to be encrypted:"
unencrypted = gets.chomp
puts "By how many letters would you like to rotate by?"
change_by = gets.chomp.to_i

def caesar_cipher(text, number)
	result = ""
	text.split("").map do |letter|
		if ("A".."Z").include? letter
			letter = ((letter.ord - 64 + number) % 26) + 64
			#Z case
			letter = 90 if letter == 64
		elsif ("a".."z").include? letter
			letter = ((letter.ord - 96 + number) % 26) + 96
			# z case
			letter = 122 if letter == 96
		end
		# Change back to character if it is an integer
		letter = letter.chr if letter.is_a? Integer
		result << letter
	end
	result
end

puts caesar_cipher(unencrypted, change_by)