=begin
This year, Santa brought little Bobby Tables a set of wires and bitwise logic gates! Unfortunately, little Bobby is a little under the recommended age range, and he needs help assembling the circuit.

Each wire has an identifier (some lowercase letters) and can carry a 16-bit signal (a number from 0 to 65535). A signal is provided to each wire by a gate, another wire, or some specific value. Each wire can only get a signal from one source, but can provide its signal to multiple destinations. A gate provides no signal until all of its inputs have a signal.

The included instructions booklet describes how to connect the parts together: x AND y -> z means to connect wires x and y to an AND gate, and then connect its output to wire z.

For example:

123 -> x means that the signal 123 is provided to wire x.
x AND y -> z means that the bitwise AND of wire x and wire y is provided to wire z.
p LSHIFT 2 -> q means that the value from wire p is left-shifted by 2 and then provided to wire q.
NOT e -> f means that the bitwise complement of the value from wire e is provided to wire f.
Other possible gates include OR (bitwise OR) and RSHIFT (right-shift). If, for some reason, you'd like to emulate the circuit instead, almost all programming languages (for example, C, JavaScript, or Python) provide operators for these gates.

For example, here is a simple circuit:

123 -> x
456 -> y
x AND y -> d
x OR y -> e
x LSHIFT 2 -> f
y RSHIFT 2 -> g
NOT x -> h
NOT y -> i
After it is run, these are the signals on the wires:

d: 72
e: 507
f: 492
g: 114
h: 65412
i: 65079
x: 123
y: 456
In little Bobby's kit's instructions booklet (provided as your puzzle input), what signal is ultimately provided to wire a?
=end

# Helper stolen from http://stackoverflow.com/a/1235990
class String
    def is_i?
       /\A[-+]?\d+\z/ === self
    end
end

class Instruction
	@outputWire
	@operator
	@fullInput
	@parameters

	def initialize(line)
		tmp = line.strip.split(" -> ")
		@fullInput = tmp[0]
		@outputWire = tmp[1]

		if @fullInput.include? 'AND'
			@operator = "AND"
			@parameters = @fullInput.split(" AND ")
		elsif @fullInput.include? 'OR'
			@operator = "OR"
			@parameters = @fullInput.split(" OR ")
		elsif @fullInput.include? 'LSHIFT'
			@operator = "LSHIFT"
			@parameters = @fullInput.split(" LSHIFT ")
		elsif @fullInput.include? 'RSHIFT'
			@operator = "RSHIFT"
			@parameters = @fullInput.split(" RSHIFT ")
		elsif @fullInput.include? 'NOT'
			@operator = "NOT"
			@parameters = @fullInput[4..-1]
		else
			@operator = "None"
			@parameters = @fullInput
		end
	end

	def operator
		return @operator
	end

	def outputWire
		return @outputWire
	end

	def fullInput
		return @fullInput
	end

	def parameters
		return @parameters
	end

	def to_s()
		return "\"#{@fullInput}\" uses operator \"#{@operator}\" to decide value of \"#{@outputWire}\". Parameters: [0 = #{@parameters[0]}], [1 = #{@parameters[1]}]."
	end
end

def ReadInstructions(filePath)
	instructions = Array.new()

	File.open(filePath).each do |line|
		instr = Instruction.new(line.strip)
		instructions.push(instr)
	end

	return instructions
end

$instructions = ReadInstructions('..\input\7.input')
$finalWires = Hash.new()

def iterateOverInstructions()
	$instructions.delete_if do |instr|
		#puts "Checking instruction: #{instr}"
		if instr.operator == "None"
			if instr.fullInput.is_i?
				$finalWires[instr.outputWire] = instr.fullInput
				true
			else
				false
			end
		elsif instr.operator == "NOT"
			if $finalWires.has_key?(instr.parameters)
				$finalWires[instr.outputWire] = 65535 - $finalWires[instr.parameters].to_i()
				true
			else
				false
			end
		elsif instr.operator == "AND"			
			if $finalWires.has_key?(instr.parameters[0]) and $finalWires.has_key?(instr.parameters[0])
				$finalWires[instr.outputWire] = $finalWires[instr.parameters[0]].to_i() & $finalWires[instr.parameters[1]].to_i()
				true
			elsif $finalWires.has_key?(instr.parameters[0]) and instr.parameters[1].is_i?
				$finalWires[instr.outputWire] = $finalWires[instr.parameters[0]].to_i() & instr.parameters[1].to_i()
				true
			elsif instr.parameters[0].is_i? and $finalWires.has_key?(instr.parameters[1])
				$finalWires[instr.outputWire] = instr.parameters[0].to_i() & $finalWires[instr.parameters[1]].to_i()
				true
			else
				false
			end
		elsif instr.operator == "OR"			
			if $finalWires.has_key?(instr.parameters[0]) and $finalWires.has_key?(instr.parameters[0])
				$finalWires[instr.outputWire] = $finalWires[instr.parameters[0]].to_i() | $finalWires[instr.parameters[1]].to_i()
				true
			elsif $finalWires.has_key?(instr.parameters[0]) and instr.parameters[1].is_i?
				$finalWires[instr.outputWire] = $finalWires[instr.parameters[0]].to_i() | instr.parameters[1].to_i()
				true
			elsif instr.parameters[0].is_i? and $finalWires.has_key?(instr.parameters[1])
				$finalWires[instr.outputWire] = instr.parameters[0].to_i() | $finalWires[instr.parameters[1]].to_i()
				true
			else
				false
			end
		elsif instr.operator == "LSHIFT"			
			if $finalWires.has_key?(instr.parameters[0]) and $finalWires.has_key?(instr.parameters[1])
				$finalWires[instr.outputWire] = $finalWires[instr.parameters[0]].to_i() << $finalWires[instr.parameters[1]].to_i()
				#puts instr
				#puts "#{instr.outputWire} = #{$finalWires[instr.parameters[0]].to_i()} LSHIFT #{$finalWires[instr.parameters[1]].to_i()}"
				true
			elsif $finalWires.has_key?(instr.parameters[0]) and instr.parameters[1].is_i?
				$finalWires[instr.outputWire] = $finalWires[instr.parameters[0]].to_i() << instr.parameters[1].to_i()
				true
			elsif instr.parameters[0].is_i? and $finalWires.has_key?(instr.parameters[1])
				$finalWires[instr.outputWire] = instr.parameters[0].to_i() << $finalWires[instr.parameters[1]].to_i()
				true
			else
				false
			end
		elsif instr.operator == "RSHIFT"			
			if $finalWires.has_key?(instr.parameters[0]) and $finalWires.has_key?(instr.parameters[1])
				$finalWires[instr.outputWire] = $finalWires[instr.parameters[0]].to_i() >> $finalWires[instr.parameters[1]].to_i()
				true
			elsif $finalWires.has_key?(instr.parameters[0]) and instr.parameters[1].is_i?
				$finalWires[instr.outputWire] = $finalWires[instr.parameters[0]].to_i() >> instr.parameters[1].to_i()
				true
			elsif instr.parameters[0].is_i? and $finalWires.has_key?(instr.parameters[1])
				$finalWires[instr.outputWire] = instr.parameters[0].to_i() >> $finalWires[instr.parameters[1]].to_i()
				true
			else
				false
			end
		end
	end
end

def PrintFinalWires
	$finalWires.each do |k,v|
		puts "This is a final wire: #{k} - #{v}"
	end
end

def PrintRemainingInstructions
	puts "There are #{$instructions.count} instructions left."
	$instructions.each do |i|
		puts "Instruction left: #{i.to_s()}."
	end
end

def IsRequiredWireFound?(requiredWire)
	return $finalWires.has_key?(requiredWire)
end

count = 0
#until IsRequiredWireFound?("a") do
while $instructions.count > 0 do
	iterateOverInstructions()
	count += 1
	
	if count >= 500000
		puts "Aborting search after #{count} cycles."
		break
	end
end

PrintFinalWires()
PrintRemainingInstructions()

puts "Final value for 'a' is '#{$finalWires["a"]}'."
