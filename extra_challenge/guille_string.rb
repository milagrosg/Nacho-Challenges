class GuilleString

	attr_reader :original_text, :number_words

	def initialize(original_text, options = {})
		@original_text = original_text
		@number_words = options[:number] || 4
	end
 
	def to_guille
		sample = []
		text = to_array
		guillenaized = String.new

		number_words.times do
			item = text.sample
			sample.push(item)
			text.delete(item)
		end

		sample.each do |word|
			guillenaized += original_text.sub(/\b#{word}\b/, word.upcase)
		end

		guillenaized
	end

	private 

	def to_array
		text = original_text.split(' ')
	end
end

