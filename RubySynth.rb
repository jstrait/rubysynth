require 'Includes'

startTime = Time.now
data = sineBeep()
data = triads()
#data = DemoSong()
#data = SweetChildOMine()
#data = SweetDreams()
stopTime = Time.now

puts "Total samples: " + data.length.to_s
puts "Max sample: " + data.max.to_s
puts "Min sample: " + data.min.to_s
puts "Time to generate sample data: " + (stopTime - startTime).to_s + " seconds."

startTime = Time.now
wave = WaveFile.new(1, 44100, 8)
wave.sampleData = data
wave.save(ARGV[0])
stopTime = Time.now
puts "Time to save wave file: " + (stopTime - startTime).to_s + " seconds."