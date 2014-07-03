class Histogram

	attr_reader :input

	def initialize(input)
		@input = input
	end

	def data
		words = to_array(to_lowercase)
		count = Hash.new(0) 

		words.each do |word|
			count[word] = count[word] + 1
		end
		
		count
	end

	private 

	def to_lowercase
		input.downcase
	end

	def to_array(text)
		text.split(' ')
	end
end
