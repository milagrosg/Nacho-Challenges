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

puts datah = count.data
puts count.by_first_letter

values = datah.values

puts "The frequency array is: #{values.join(', ')}."
 
stat = Statistics.new(values)

puts "The average of the frequency is #{stat.average}."

puts "The median of the frequency is #{stat.median}."

puts "The mode(s) of the frequency is #{stat.mode.join(', ')}."

puts "These words appear above average: "

# datah.each_pair {| word, value | puts word if value > stat.average }

puts datah.select { |word, value| value > stat.average}.keys
