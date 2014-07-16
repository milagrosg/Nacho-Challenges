# Public: Various methods useful for performing statistical operations.
class Statistics

  # Public: Returns the Array of ocurrences.
  attr_reader :frequency

  # Public: Initialize a new Statistic.
  #
  # frequency - An Array that represents the ocurrences.  
  def initialize(frequency)
    @frequency = frequency
  end

  # Public: Calculate the ocurrences' average.
  #
  # Returns a Float value which represents the average of the ocurrences.
  def average
    value = frequency.inject(:+) 

    value / frequency.length.to_f
  end

  # Public: Calculate the ocurrences' median.
  #
  # Returns a Float value which represents the median of the ocurrences. 
  #   If the lenght of the array which contains the ocurrences is odd, then the
  #   median is represented by the value in the middle position of the array.
  #   If it is even, the median is the average of the two middle position values. 
  def median
    sorted = frequency.sort

    if sorted.length.odd?
      value = sorted[sorted.length/2]
    else
      value = (sorted[(sorted.length / 2) - 1] + sorted[sorted.length / 2]) / 2.0
    end
  end

  # Public: Calculate the ocurrencies' mode.
  #
  # Returns an Array which contains the mode(s) of the ocurrences. 
  #   A number that appears most often is the mode. 
  #   There can be more than one mode in a given set of numbers. 
  def mode
    freqh = frequency.inject(Hash.new(0)) { |h,v| h[v] += 1; h}

    freqh.select { |k, v| v == freqh.values.max}.keys
  end
end
