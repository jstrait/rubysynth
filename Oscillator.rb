class Oscillator
  def initialize(sampleRate, frequency, amplitude)
    @sampleRate = sampleRate
    self.frequency = frequency
    @amplitude = amplitude
    
    @periodOffset = 0.0
  end

  # Placeholder that is overridden by actual non-abstract class
  def waveFunction
    return 0.0
  end

  def nextSample
    sample = waveFunction
    
    @periodOffset += @periodDelta
    if @periodOffset >= 1.0
      @periodOffset -= 1.0
    end
    
    return sample
  end

  def nextSamples(numSamples)
    samples = Array.new(numSamples)

    (0..numSamples).each do |i|
      samples[i - 1] = nextSample()
    end

    samples
  end
  
  def frequency
    @frequency
  end
  
  def frequency=(newFrequency)
    @frequency = newFrequency
    @periodDelta = @frequency / @sampleRate
  end
    
  attr_accessor :amplitude
  attr_reader :sampleRate, :periodOffset, :periodDelta
end


class SineOscillator < Oscillator
  def waveFunction
    @amplitude * Math::sin(@periodOffset * 2.0 * Math::PI)
  end
end


class SquareOscillator < Oscillator
  def waveFunction
    if @periodOffset >= 0.5
      return @amplitude
    else
      return -@amplitude
    end
  end
end


class SawtoothOscillator < Oscillator
  def waveFunction
    (1.0 - (@periodOffset * 2.0)) / (1.0 / @amplitude)
  end
end


class NoiseOscillator < Oscillator
  def waveFunction
    if @frequency == 0.0
      return 0.0
    else
      return (1.0 - (rand() * 2.0)) / (1.0 / @amplitude)
    end
  end
end