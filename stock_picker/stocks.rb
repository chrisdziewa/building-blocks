def stock_picker(days)
	count = 0
	highest_profit = {profit: 0}
	days.each do |day|
		new_array = days[(count)...(days.length)]
		smallest = new_array.shift
		largest = new_array.max

		buy = {price: smallest, index: days.index(smallest)}

		sell = {price: largest, index: days.index(largest)}
		unless largest.nil? or smallest.nil?
			total = { profit: (sell[:price] - buy[:price]), buy: buy, sell: sell }
			if total[:profit] > highest_profit[:profit]
				highest_profit = total
			end
		end
		count += 1
	end
	if highest_profit[:profit] == 0 
		puts "You won't make any profit either way"
	else
		puts "[#{highest_profit[:buy][:index]}, #{highest_profit[:sell][:index]}]"
	end
end

stock_picker([15, 40, 15, 3, 10, 18, 1]) 
# => [0, 1] # for a profit of $40 - $15 == $25
stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4] # for a profit of $15 - $3 == $12
stock_picker([15,15,4])
# => You won't make any profit either way