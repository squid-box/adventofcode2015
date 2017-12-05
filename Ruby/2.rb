def findSmallestSquare(threeDimensions)
	threeDimensions = threeDimensions.sort
	return threeDimensions[0] * threeDimensions[1]
end

def findRibbonLength(threeDimensions)
	threeDimensions = threeDimensions.sort
	return threeDimensions[0]*2 + threeDimensions[1]*2
end

def findVolume(threeDimensions)
	return threeDimensions.inject(:*)
end

requiredPaper = 0
requiredRibbon = 0

File.open('..\input\2.input').each do |line|
	# Map string input to integers.
	dim = line.split('x').map(&:to_i)
	
	l = dim[0]
	w = dim[1]
	h = dim[2]
		
	totalArea = (2*l*w) + (2*w*h) + (2*h*l)
	smallestSide = findSmallestSquare(dim)
	
	requiredPaper += totalArea + smallestSide
	
	requiredRibbon += findRibbonLength(dim)
	requiredRibbon += findVolume(dim)
end

puts "The elves will need #{requiredPaper} square feet of paper."
puts "The elves also need #{requiredRibbon} feet of ribbon."
