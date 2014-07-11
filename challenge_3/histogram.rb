class Histogram

  attr_reader :input

  def initialize(input)
    @input = input
  end

  def data
    count = Hash.new(0) 

    split_input.each do |word|
      count[word] += 1
    end

    count
  end

  def by_first_letter
    final = Hash.new(0)

    data.each do |word, qty|
      final[word[0]] = qty
    end

    final
  end

  private 

  def split_input
    input.downcase.split(/\W+/).sort
  end
end

