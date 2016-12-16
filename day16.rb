input = "10011111011011001"

# Part 1
disk_length = 272

# Part 2
disk_length = 35651584

a = input

while a.length < disk_length
	a = "#{a}0#{a.reverse.chars.map! { |x| (1-x.to_i).to_s }.join}"
end

a = a[0...disk_length]

checksum = a

while checksum.length.even?
	pairs = checksum.chars.each_slice(2).map(&:join)
	pairs.map! { |x| (1 - (x[0].to_i + x[1].to_i) % 2).to_s }
	checksum = pairs.join
end

p checksum