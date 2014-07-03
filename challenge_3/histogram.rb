class Histogram

	attr_reader :input

	def initialize(input)
		@input = input
	end

	def data
		words = to_array
		count = Hash.new(0) 

		words.each do |word|
			count.store(word, count[word] + 1)
		end
		
		count
	end

	private 

	def to_array
		input.split(' ')
	end
end
