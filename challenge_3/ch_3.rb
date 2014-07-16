require './histogram'
require './statistics'

filename = ARGV.first

if filename.nil? 
  puts "No filename specified.\nUsage:\nruby " + __FILE__ + " <filename>\nPlease try again!"
  exit 1
elsif File.exist?(filename) == false
  puts "This file does not exist.\nUsage:\nruby " + __FILE__ + " <filename>\nPlease try again!"
  exit 1
end

txt = File.read(filename)

count = Histogram.new(txt)

datah = count.data
puts count.by_first_letter

arr = []

datah.each_pair do |key, val|
  arr.push(val)
end

puts "The frequency array is: #{arr.join(', ')}."
 
stat = Statistics.new(arr)

puts "The average of the frequency is #{stat.average}."

puts "The median of the frequency is #{stat.median}."

puts "The mode(s) of the frequency are #{stat.mode}."