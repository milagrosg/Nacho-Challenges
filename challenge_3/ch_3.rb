require './histogram'

filename = ARGV.first

if filename == nil 
  puts "No filename specified. Please try again!"
elsif File.exist?(filename) == false
  puts "This file does not exist. Please try again!"
else 
  txt = File.read(filename)

  count = Histogram.new(txt)

  puts count.data
  puts count.by_first_letter
end 
