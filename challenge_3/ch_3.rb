require './histogram'

puts "Input your text for word count: "
input = gets.chomp

count = Histogram.new(input)

puts count.data


