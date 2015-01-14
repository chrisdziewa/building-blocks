def substrings(words, dictionary)
	words = words.split(/\s/)
	result = {}
	words.each do |word|
	    word.downcase!
		
		dictionary.each do |substring|
			match = word.scan(substring)
			unless match.empty?
				if result[substring].nil?
					result[substring] = match.size
				else
					result[substring] += 1	
				end
			end
		end
	end
	result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


puts substrings("below", dictionary)

puts substrings("Howdy partner, sit down! How's it going?", dictionary)