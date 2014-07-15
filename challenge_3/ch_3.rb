require './histogram'

filename = ARGV.first

while filename == nil || filename == "" do
  puts "No filename specified. Please try again!"
  filename = STDIN.gets.chomp()
end 

txt = File.open(filename)

count = Histogram.new(txt.read)

puts count.data
puts count.by_first_letter

