input = "cpy 1 a
cpy 1 b
cpy 26 d
jnz c 2
jnz 1 5
cpy 7 c
inc d
dec c
jnz c -2
cpy a c
inc a
dec b
jnz b -2
cpy c b
dec d
jnz d -6
cpy 14 c
cpy 14 d
inc a
dec d
jnz d -2
dec c
jnz c -5"

instructions = input.split("\n")
regs = {:a => 0, :b => 0, :c => 0, :d => 0}
i = 0

while i < instructions.length
	instruction = instructions[i]
	case instruction.split(" ")[0]
	when "cpy"
		regs[instruction.split(" ")[2].to_sym] = (instruction.split(" ")[1].to_i > 0) ? instruction.split(" ")[1].to_i : regs[instruction.split(" ")[1].to_sym]
		i += 1
	when "jnz"
		if instruction.split(" ")[1].to_i > 0
			i += instruction.split(" ")[2].to_i
		elsif regs[instruction.split(" ")[1].to_sym] != 0
				i += instruction.split(" ")[2].to_i
		else
			i += 1
		end
	when "inc"
		regs[instruction.split(" ")[1].to_sym] += 1
		i += 1
	when "dec"
		regs[instruction.split(" ")[1].to_sym] -= 1
		i += 1
	end
end

p regs