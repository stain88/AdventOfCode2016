input = "Disc #1 has 5 positions; at time=0, it is at position 2.
Disc #2 has 13 positions; at time=0, it is at position 7.
Disc #3 has 17 positions; at time=0, it is at position 10.
Disc #4 has 3 positions; at time=0, it is at position 2.
Disc #5 has 19 positions; at time=0, it is at position 9.
Disc #6 has 7 positions; at time=0, it is at position 0."

discs = []

layout = input.split("\n")
layout.each do |disc_info|
	matcher = disc_info.match(/Disc \#(\d+) has (\d+) positions; at time=(\d+), it is at position (\d+)/)
	discs[matcher[1].to_i - 1] = {:number => matcher[1].to_i, :positions => matcher[2].to_i, :start_time => matcher[3].to_i, :start_pos => matcher[4].to_i, :current_pos => matcher[4].to_i}
end

time = 0
found_time = false

while !found_time
	discs.each do |disc|
		disc[:current_pos] = (disc[:start_pos] + time + 1 + disc[:number]) % disc[:positions]
	end
	found_time = true if discs.count { |d| d[:current_pos] == 0 } == discs.length
	time += 1
end

p time