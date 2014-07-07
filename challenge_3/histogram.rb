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
    
    sort_by_first_word(count)
  end

  private 

  def split_input
    input.downcase.split(/\W+/)
  end

  def sort_by_first_word(data)
    Hash[data.sort]
  end

  def sort_low_to_high(data)
    data.sort_by {|key, value| value}
  end
end
