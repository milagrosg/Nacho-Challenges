require './histogram'

filename = ARGV.first

if filename.nil? 
  puts "No filename specified.\nUsage:\nruby #{$0} <filename>\nPlease try again!"
  exit 1
elsif File.exist?(filename) == false
  puts "This file does not exist.\nUsage:\nruby #{$0} <filename>\nPlease try again!"
  exit 1
end

txt = File.read(filename)

count = Histogram.new(txt)

puts count.data
puts count.by_first_letter
 
