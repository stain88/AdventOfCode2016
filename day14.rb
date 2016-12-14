require "digest"

INPUT = "ngcjuoqr"
# INPUT = "abc"

# Part 1
i = 0
valid_index = []

while valid_index.length < 64
	first_hash = Digest::MD5.hexdigest("#{INPUT}#{i}")
	if first_hash.match(/(.)\1\1/)
		matcher = first_hash.match(/(.)\1\1/)[1]
		j = i+1
		while j < i + 1000
			second_hash = Digest::MD5.hexdigest("#{INPUT}#{j}")
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

# Part 2
i = 0
valid_index = []
HASHES = []

def get_hash(ind)
	hash = Digest::MD5.hexdigest("#{INPUT}#{ind}")
	2016.times { hash = Digest::MD5.hexdigest(hash) }
	HASHES[ind] = hash
	hash
end

while valid_index.length < 64
	first_hash = HASHES[i] || get_hash(i)
	if first_hash.match(/(.)\1\1/)
		matcher = first_hash.match(/(.)\1\1/)[1]
		j = i+1
		while j < i + 1000
			second_hash = HASHES[j] || get_hash(j)
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
