# Home made shitty Coordinate class.
class Coordinate
	def initialize(x, y)
		@x = x
		@y = y
	end

	def moveUp
		@y -= 1
	end

	def moveDown
		@y += 1
	end

	def moveLeft
		@x -= 1
	end

	def moveRight
		@x += 1
	end

	def toString
		return "(#{@x},#{@y})"
	end
end

# First half of the assignment.
def OnlySanta
	file = File.open('..\input\3.input')
	pos = Coordinate.new(0,0)
	houseVisits = Hash.new(0)

	houseVisits[pos.toString] += 1

	# Simulate trip...
	file.each_char do |character|
		if character == '^'
			pos.moveUp
		elsif character == '<'
			pos.moveLeft
		elsif character == '>'
			pos.moveRight
		elsif character == 'v'
			pos.moveDown
		end

		houseVisits[pos.toString] += 1
	end

	# Counting gifts in houses...
	moreThanOneGift = 0
	houseVisits.each do |key, value|
		if value >= 1
			moreThanOneGift += 1
		end
	end

	puts "With only Santa #{moreThanOneGift} houses got more than one gift."
end

# Second half of the assignment.
def TwoSantas
	file = File.open('..\input\3.input')
	@santaPos = Coordinate.new(0,0)
	@roboPos  = Coordinate.new(0,0)
	houseVisits = Hash.new(0)
	robotSantaTurn = false

	# Both Santa's start at same house.
	houseVisits[@santaPos.toString] = 2

	# Simulate trip...
	file.each_char do |character|
		# Depending on who's turn it is:
		if robotSantaTurn
			pos = @roboPos
		else
			pos = @santaPos
		end

		if character == '^'
			pos.moveUp
		elsif character == '<'
			pos.moveLeft
		elsif character == '>'
			pos.moveRight
		elsif character == 'v'
			pos.moveDown
		end

		houseVisits[pos.toString] += 1
		robotSantaTurn = !robotSantaTurn
	end

	# Counting gifts in houses...
	moreThanOneGift = 0
	houseVisits.each do |key, value|
		if value >= 1
			moreThanOneGift += 1
		end
	end

	puts "With Robot-Santa #{moreThanOneGift} houses got more than one gift."
end

OnlySanta()
TwoSantas()