def stock_picker(days)
	buy, sell, total = 0,0,0
	day1_count = 0
	if days.length > 1
		while day1_count < days.length	
			day2_count = day1_count + 1
			while day2_count < days.length
				current_total = days[day2_count] - days[day1_count]
				if current_total > total
					buy, sell, total = day1_count, day2_count, current_total 
				end
				day2_count += 1
			end
			day1_count += 1
		end
	end
	"[#{buy}, #{sell}]"
end

puts stock_picker([15, 40, 15, 3, 10, 18, 1]) 
# => [0, 1] # for a profit of $40 - $15 == $25
puts stock_picker([15,17,3,6,9,15,8,6,1,10])
# => [2,5] # for a profit of $15 - $3 == $12
puts stock_picker([15,15, 4])
# [0,0]
puts stock_picker([15,4,10,3,18,1])
#[3,4]