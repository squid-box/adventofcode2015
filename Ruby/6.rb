require 'matrix'

# Matrix magic stolen from http://stackoverflow.com/a/21559458
class Matrix
  public :"[]=", :set_element, :set_component
end

# Parse Santa's instructions
def ReadSantasInstructions(filePath, useOldStyle)
	matrix = Matrix.build(1000) { 0 }

	File.open(filePath).each do |line|
		if useOldStyle
			FollowOldInstructions(line, matrix)
		else
			FollowNewInstructions(line, matrix)
		end
	end

	return matrix
end

# First way of reading instructions / setting lights on/off.
def FollowOldInstructions(line, matrix)
	# Find the coordinates mentioned.
	matches = line.strip.scan(/\d+,\d+/)
	
	firstPoint = matches[0].split(',').map(&:to_i)
	secondPoint = matches[1].split(',').map(&:to_i)
	
	for i in Range.new(firstPoint[0], secondPoint[0])
		for j in Range.new(firstPoint[1], secondPoint[1])
			if line.include? "turn on"
				matrix[i,j] = 1
			elsif line.include? "turn off"
				matrix[i,j] = 0
			else
				if matrix[i,j] == 0
					matrix[i,j] = 1
				else
					matrix[i,j] = 0
				end
			end
		end
	end

	return matrix
end

# Second way of reading instructions / setting brightness.
def FollowNewInstructions(line, matrix)
	# Find the coordinates mentioned in the line.
	matches = line.strip.scan(/\d+,\d+/)
	
	firstPoint = matches[0].split(',').map(&:to_i)
	secondPoint = matches[1].split(',').map(&:to_i)
	
	for i in Range.new(firstPoint[0], secondPoint[0])
		for j in Range.new(firstPoint[1], secondPoint[1])
			if line.include? "turn on"
				matrix[i,j] += 1
			elsif line.include? "turn off"
				matrix[i,j] -= 1
				if matrix[i,j] < 0
					matrix[i,j] = 0
				end
			else
				matrix[i,j] += 2
			end
		end
	end

	return matrix
end

# Count the lights / brightness (works for both).
def countLights(matrix)
	litLights = 0

	for i in 0..999
		for j in 0..999
			litLights += matrix[i,j]
		end
	end

	return litLights
end

puts "Old translation: There are #{countLights(ReadSantasInstructions('..\input\6.input', true))} lit lights."
puts "New translation: The brightness is #{countLights(ReadSantasInstructions('..\input\6.input', false))}."
