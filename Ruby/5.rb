# A string is nice if: It contains at least three vowels.
def ContainsThreeVowels?(input)
	return input.count("aeiou") >= 3
end

# A string is nice if it contains at least one letter that appears twice in a row.
def ContainsDoubleOccurence?(input)
	for i in 0..input.length-1 # We'll never check the last char.
		if input[i] == input[i+1]
			return true
		end
	end

	return false
end

# A string is not nice if it contains 'ab', 'cd', 'pq', or 'xy'
def ContainsBadStringParts?(input)
	for i in 0..input.length-1 # We'll never check the last char.
		if input[i] == 'a'
			if input[i+1] == 'b'
				return true
			end
		elsif input[i] == 'c'
			if input[i+1] == 'd'
				return true
			end
		elsif input[i] == 'p'
			if input[i+1] == 'q'
				return true
			end
		elsif input[i] == 'x'
			if input[i+1] == 'y'
				return true
			end
		end
	end

	return false
end

# A string is nice if "It contains a pair of any two letters that appears at least twice in the string without overlapping"
def ContainsDoubleDoubleOccurence?(input)
	for i in 0..input.length-2 # We'll never check the last two chars.
		target = (input[i] + input[i+1])
		for j in i+1..input.length-2
			if input[j] + input[j+1] == target
				return true
			end
		end
	end

	return false
end

# A string is nice if "It contains at least one letter which repeats with exactly one letter between them"
def ContainsLetterRepeatedWithPause?(input)
	for i in 0..input.length-2 # We'll never check the last two chars.
		if input[i] == input[i+2]
			return true
		end
	end

	return false
end

# The old, flawed way of deciding niceness.
def OldWay
	niceStrings = 0

	File.open('..\input\5.input').each do |line|
		if ContainsThreeVowels?(line.strip) and ContainsDoubleOccurence?(line.strip) and not ContainsBadStringParts?(line.strip)
			niceStrings += 1
		end
	end

	puts "Old way found #{niceStrings} nice strings."
end

# The new, possibly better way of determining niceness.
def NewWay
	niceStrings = 0

	File.open('..\input\5.input').each do |line|
		if ContainsDoubleDoubleOccurence?(line.strip) and ContainsLetterRepeatedWithPause?(line.strip)
			niceStrings += 1
		end
	end

	puts "New way found #{niceStrings} nice strings."
end

# Loop through all lines and evaluate their niceness.
OldWay()
NewWay()
