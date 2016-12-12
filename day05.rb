require "digest"

input = "wtnhxymk"
i = 0
hexhash = ""

# Part 1
# pass = ""


# while pass.length < 8
# 	hexhash = Digest::MD5.hexdigest("#{input}#{i}")
# 	if hexhash[0,5] == "00000"
# 		pass += hexhash[5]
# 	end
# 	i += 1
# end

# p pass

# Part 2
pass = "________"
while pass.include? "_"
	hexhash = Digest::MD5.hexdigest("#{input}#{i}")
	if hexhash[0,5] == "00000"
		if "01234567".include?(hexhash[5]) && pass[hexhash[5].to_i] == "_"
			pass[hexhash[5].to_i] = hexhash[6]
			p pass
		end
	end
	i += 1
end
