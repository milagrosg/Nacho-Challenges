# Public: Various methods for calculating the frequency of words or first
# letters in a given String.
class Histogram

  # Public: Returns the String input to be evaluated.
  attr_reader :input

  # Public: Initialize a new Histogram.
  #
  # input - The String that is going to be analyzed.
  def initialize(input)
    @input = input
  end

  # Public: Compute the frequency of each word in a given string. 
  #
  # Returns a Hash with the following key-value pair {word => frequency}.
  def data
    count = Hash.new(0) 

    split_input.each do |word|
      count[word] += 1
    end

    count
  end

  # Public: Compute the frequency of first letter of words in a given string. 
  #
  # Returns a Hash with the following key-value pair {first letter => frequency}.
  def by_first_letter
    final = Hash.new(0)

    split_input.each do |word|
      final[word[0]] += 1
    end

    final
  end

  private 

  def split_input
    input.downcase.split(/\W+/).sort
  end
end

