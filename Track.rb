class Track
  def initialize(instrument)
    @instrument = instrument
    @notes = []
    @noteIndex = -1
    @sampleLength = 0
  end
  
  def nextSample
    if @noteIndex == -1
        @instrument.note = @notes[0]
        @noteIndex = 0
    end
    
    if @instrument.note != nil
      sample = @instrument.nextSample
    else      
      if @noteIndex < @notes.length
        @noteIndex += 1
                
        @instrument.note = @notes[@noteIndex]        
        sample = @instrument.nextSample()
      else
        sample = 0.0
      end
    end
    
    sample
  end
  
  def nextSamples(numSamples)
    samples = Array.new(numSamples)
    
    (0..numSamples).each do |i|
      samples[i - 1] = nextSample()
    end
    
    samples
  end
  
  def sampleLength()
    @notes.inject(0) {|sum, note| sum + (@instrument.samplesPerBeat * (4.0 / note.duration)) }
  end
  
  attr_accessor :notes, :instrument
end