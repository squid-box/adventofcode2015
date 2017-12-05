floor = 0
pos = 0
enteredBasement = false
file = File.open('..\input\1.input')

file.each_char do |character|
	pos += 1
  	if character == '('
  		floor += 1
  	else
  		floor -= 1
  	end

  	if floor < 0 and not enteredBasement
  		enteredBasement = true
  		puts "Santa first entered the basement at position: #{pos}."
  	end
end

puts "Santa ends up on floor #{floor}."
