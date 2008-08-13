require 'Includes'

SAMPLES_PER_SECOND = 44100

def timer(&block)
  startTime = Time.now
  yield  
  return Time.now - startTime
end

# Test performance of basic oscillators
sine = SineOscillator.new(SAMPLES_PER_SECOND, 440.0, 0.5)
square = SquareOscillator.new(SAMPLES_PER_SECOND, 440.0, 0.5)
saw = SawtoothOscillator.new(SAMPLES_PER_SECOND, 440.0, 0.5)
noise = NoiseOscillator.new(SAMPLES_PER_SECOND, 440.0, 0.5)

o = SineOscillator.new(SAMPLES_PER_SECOND, 440.0, 0.5)
time = timer { o.nextSamples(SAMPLES_PER_SECOND * 10) }
puts "Sine Oscillator: " + time.to_s + " seconds"

o = SquareOscillator.new(SAMPLES_PER_SECOND, 440.0, 0.5)
time = timer { o.nextSamples(SAMPLES_PER_SECOND * 10) }
puts "Square Oscillator: " + time.to_s + " seconds"

o = SawtoothOscillator.new(SAMPLES_PER_SECOND, 440.0, 0.5)
time = timer { o.nextSamples(SAMPLES_PER_SECOND * 10) }
puts "Sawtooth Oscillator: " + time.to_s + " seconds"

o = NoiseOscillator.new(SAMPLES_PER_SECOND, 440.0, 0.5)
time = timer { o.nextSamples(SAMPLES_PER_SECOND * 10) }
puts "Noise Oscillator: " + time.to_s + " seconds"

=begin
tests = [["Sine Oscillator", { sine.nextSamples(SAMPLES_PER_SECOND) }],
             ["Square Oscillator", { square.nextSamples(SAMPLES_PER_SECOND) }],
             ["Sawtooth Oscillator", { sawtooth.nextSamples(SAMPLES_PER_SECOND) }],
             ["Noise Oscillator", { noise.nextSamples(SAMPLES_PER_SECOND) }]]


time = timer { o.nextSamples(SAMPLES_PER_SECOND) }
puts time
=end