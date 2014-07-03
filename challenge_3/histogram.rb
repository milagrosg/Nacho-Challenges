class Histogram

	attr_reader :input

	def initialize(input)
		@input = input
	end

	def data
		words = split_input
		count = Hash.new(0) 

		words.each do |word|
			count[word] += 1
		end
		
		count
	end

	private 

	def split_input
		input.downcase.split(/\W+/)
	end
end
