require './guille_string'

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

guillenated = GuilleString.new(original_text, number: number)

puts guillenated.to_guille()
#puts guillenated.to_guille()



