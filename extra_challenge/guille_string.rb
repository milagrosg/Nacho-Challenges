class GuilleString

	def initialize(original_text, options = {})
		@original_text = original_text
		@number_words = options[:number_words] || 4
	end

	def to_array()
		@text = @original_text.split(' ')
	end
 
	def to_guille()
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

		puts @original_text
	end

	private :to_array

end


def prompt()
	print ">"
end

puts "What do you want to translate to Guille's slang?"
prompt; original_text = gets.chomp

text = original_text.split(' ')

if text.count == 0
	puts "You have to input a text to be tranlated to Guille's slang. Try again."
	Process.exit(0)
end

puts "How many words to you want to uppercase?"
prompt; number = gets.chomp

number = number.to_i

if number > text.count
	puts "Your original text has less than #{number} words. Try again."
	Process.exit(0)
end

guillenated = GuilleString.new(original_text,number: number)

guillenated.to_guille()

