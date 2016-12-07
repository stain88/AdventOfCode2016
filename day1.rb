input = "L5, R1, R3, L4, R3, R1, L3, L2, R3, L5, L1, L2, R5, L1, R5, R1, L4, R1, R3, L4, L1, R2, R5, R3, R1, R1, L1, R1, L1, L2, L1, R2, L5, L188, L4, R1, R4, L3, R47, R1, L1, R77, R5, L2, R1, L2, R4, L5, L1, R3, R187, L4, L3, L3, R2, L3, L5, L4, L4, R1, R5, L4, L3, L3, L3, L2, L5, R1, L2, R5, L3, L4, R4, L5, R3, R4, L2, L1, L4, R1, L3, R1, R3, L2, R1, R4, R5, L3, R5, R3, L3, R4, L2, L5, L1, L1, R3, R1, L4, R3, R3, L2, R5, R4, R1, R3, L4, R3, R3, L2, L4, L5, R1, L4, L5, R4, L2, L1, L3, L3, L5, R3, L4, L3, R5, R4, R2, L4, R2, R3, L3, R4, L1, L3, R2, R1, R5, L4, L5, L5, R4, L5, L2, L4, R4, R4, R1, L3, L2, L4, R3"

moves = input.split(", ")

facing = "north"
x = 0
y = 0

moves.each do |move|
	dir = move[0]
	if dir == "L"
		case facing
		when "north"
			facing = "west"
		when "west"
			facing = "south"
		when "south"
			facing = "east"
		when "east"
			facing = "north"
		end
	else
		case facing
		when "north"
			facing = "east"
		when "east"
				facing = "south"
		when "south"
			facing = "west"
		when "west"
			facing = "north"
		end
	end
	steps = move[1..-1].to_i
	case facing
	when "north"
		y += steps
	when "south"
		y -= steps
	when "east"
		x += steps
	when "west"
		x -= steps
	end
end

p x.abs + y.abs