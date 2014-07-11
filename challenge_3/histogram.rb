class Histogram

  attr_reader :input

  def initialize(input)
    @input = input
  end

  def data
    sort_by_first_letter(frequency)
  end

  def by_first_letter
    freq = Hash.new(0)
    final = Hash.new(0)
    freq = frequency

    freq.each do |word, qty|
      final[word[0]] = qty
    end

    sort_by_first_letter(final)
  end

  private 

  def frequency
    count = Hash.new(0) 

    split_input.each do |word|
      count[word] += 1
    end

    count
  end

  def split_input
    input.downcase.split(/\W+/)
  end

  def sort_by_first_letter(data)
    Hash[data.sort]
  end
end

