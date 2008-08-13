class Song
  def initialize
    @tracks = []
  end
  
  def nextSample
    sample = @tracks.inject(0.0) {|sum, track| sum += track.nextSample() }
    sample = sample / @tracks.length
  end

  def nextSamples(numSamples)
    samples = Array.new(numSamples)

    (0..numSamples).each do |i|
      samples[i - 1] = nextSample()
    end

    samples
  end
  
  def sampleLength()
    @tracks.inject(0) {|longest, track| (longest > track.sampleLength) ? longest : track.sampleLength}
  end
  
  attr_accessor :tracks
end