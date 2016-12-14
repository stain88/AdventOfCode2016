require "digest"

input = "ngcjuoqr"
# input = "abc"

i = 0

valid_index = []

# Part 1
while valid_index.length < 64
	first_hash = Digest::MD5.hexdigest("#{input}#{i}")
	if first_hash.match(/(.)\1\1/)
		matcher = first_hash.match(/(.)\1\1/)[1]
		j = i+1
		while j < i + 1000
			second_hash = Digest::MD5.hexdigest("#{input}#{j}")
			if second_hash.match(Regexp.new(matcher*5))
				valid_index << i
				break
			end
			j += 1
		end
	end
	i += 1
end

p valid_index.last