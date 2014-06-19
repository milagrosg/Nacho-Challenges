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

if number.to_i > text.count
	puts "Your original text has less than #{number} words. Try again."
	Process.exit(0)
end

sample = []

i = 0 
while i < number.to_i 
	sample.push(text.sample)
	i = i + 1
end

for word in sample
	original_text.gsub!(word, word.upcase())
end

puts original_text


