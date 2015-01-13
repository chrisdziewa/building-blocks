puts "Please enter some text to be encrypted:"
unencrypted = gets.chomp
puts "By how many letters would you like to rotate by?"
change_by = gets.chomp.to_i

def caesar_cipher(text, number)
	text.split("").map do |letter|
		if ("A".."Z").include? letter
			letter = ((letter.ord - 64 + number) % 26) + 64
			#Z case
			if letter == 64
				letter = 90
			end
			letter = letter.chr
		elsif ("a".."z").include? letter
			letter = ((letter.ord - 96 + number) % 26) + 96
			# z case
			if letter == 96
				letter = 122
			end
			letter = letter.chr
		else 
			letter
		end	
	end
end

puts caesar_cipher(unencrypted, change_by)