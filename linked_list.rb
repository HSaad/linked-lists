require './node'

class LinkedList
	attr_accessor :node_list
	
	def initialize
		@node_list = []
	end

	def append(node)
		@node_list.last.next_node = node if !(@node_list.empty?) 
		
		@node_list.push(node)
	end

	def prepend(node)
		node.next_node = @node_list.first if !(@node_list.empty?)
		
		@node_list.unshift(node)
	end

	def size
		return @node_list.size
	end

	def head
		return @node_list.first
	end

	def tail
		return @node_list.last
	end

	def at(index)
		return @node_list[index]
	end

	def pop
		@node_list.pop
		@node_list.last.next_node = nil
	end

	def contains?(value)
		@node_list.each do |node|
			return true if node.value == value
		end
		return false
	end

	def find(data)
		@node_list.each_with_index do |node, index|
			return index if node.value == data
		end
		return nil
	end

	def to_s
		string = ""
		
		@node_list.each do |node|
			string += "( #{node.value} ) -> "
			string += "nil" if node == @node_list.last
		end
		
		return string
	end

	def insert_at(index, node=nil)
		node = Node.new if node == nil
		node.next_node = @node_list[index]
		@node_list.insert(index, node)
		@node_list[index - 1].next_node = node if index - 1 >= 0
	end

	def remove_at(index)
		@node_list[index - 1].next_node = @node_list[index + 1] 
		@node_list.delete_at(index)
	end

end