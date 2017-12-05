require 'digest/md5'

# Evaluate whether or not string starts with <zeroes>.
def stringStartsWithLeadingZeroes?(input, zeroes)
	comparison = "0" * zeroes
	return input.start_with?(comparison)
end

# Calculate md5 checksum for a given <input> string.
def calculateMd5(input)
	return Digest::MD5.hexdigest(input)
end

# Find lowest number for <secret> that creates a hash with <leadingZeroes>.
def FindLowestValueFor(secret, leadingZeroes)
	for i in 0..99999999 # Arbitrarily high number to stop at.
		current = secret + i.to_s()
		if stringStartsWithLeadingZeroes?(calculateMd5(current), leadingZeroes)
			puts "#{leadingZeroes} leading zeroes when input is #{secret} + #{i}: #{calculateMd5(current)}."
			return i
		end
	end
end

# Assignment:
FindLowestValueFor("ckczppom", 5)
FindLowestValueFor("ckczppom", 6)
