require 'set'

class Edge
	@source
	@destination
	@distance

	def initialize(source, destination, distance)
		@source = source
		@destination = destination
		@distance = distance
	end

	def source
		return @source.to_s()
	end

	def destination
		return @destination.to_s()
	end

	def distance
		return @distance.to_i()
	end

	def to_s()
		return "#{@source} -> #{@destination} (#{@distance})."
	end
end

def FindNodesInEdgeList(listOfEdges)
	nodes = Set.new()

	listOfEdges.each do |edge|
		nodes.add(edge.source)
		nodes.add(edge.destination)
	end

	return nodes
end

def ReadInput(filePath)
	edges = Set.new()

	File.open(filePath).each do |line|
		tmp = line.strip.split(" = ")
		distance = tmp[1].to_i()
		tmp2 = tmp[0].strip.split(" to ")
		source = tmp2[0]
		destination = tmp2[1]
		edge = Edge.new(source, destination, distance)
		edges.add(edge)
	end

	return edges
end

def PrintInfo(edges)
	availableNodes = FindNodesInEdgeList(edges)

	availableNodes.each do |n|
		puts "Node: #{n}"
	end

	edges.each do |e|
		puts "Edge: #{e}"
	end
end

def FindRoutes(edges)
	visited = Set.new()
	path = Array.new()

	edges.each do |e|
		path.push(e)
	end

	return path
end

PrintInfo(ReadInput('..\input\9t.input'))
res = FindRoutes(ReadInput('..\input\9t.input'))

res.each do |r|
	puts r
end
