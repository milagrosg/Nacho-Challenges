class Statistics

  attr_reader :frequency

  def initialize(frequency)
    @frequency = frequency
  end

  def average
    value = frequency.inject(0) { |total, num| total += num }

    value / frequency.length.to_f
  end

  def median
    sorted = frequency.sort

    if sorted.length.odd?
      value = sorted[sorted.length/2]
    else
      value = (sorted[(sorted.length / 2) - 1] + sorted[sorted.length / 2]) / 2.0
    end
  end

  def mode
    freqh = frequency.inject(Hash.new(0)) { |h,v| h[v] += 1; h}

    freqh.select { |k, v| v == freqh.values.max}.keys
  end
end
