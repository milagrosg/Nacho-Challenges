class GuilleString

	def initialize(original_text, options = {})
		@original_text = original_text
		@number_words = options[:number_words] || 4
	end
 
	def to_guille
		sample = []
		to_array

		@number_words.times do
			item = @text.sample
			sample.push(item)
			@text.delete(item)
		end

		sample.each do |word|
			@original_text.gsub!(/\b#{word}\b/, word.upcase)
		end

		return @original_text
	end

	private 

	def to_array
		@text = @original_text.split(' ')
	end
end

