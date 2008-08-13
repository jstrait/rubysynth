class Instrument
  def initialize(beatsPerMinute, oscillator, overtones, vibratoLFO = nil, volumeLFO = nil)
    @beatsPerMinute = beatsPerMinute
    @oscillator = oscillator
    @overtones = overtones
    @vibratoLFO = vibratoLFO
    @volumeLFO = volumeLFO
    
    @prevVibratoSample = 0.0
    @prevVolumeSample = 0.0
    
    @samplesPerBeat = (oscillator.sampleRate * 60) / beatsPerMinute;
    @note = nil
    @noteSampleLength = 0
    @sampleIndex = 0
    
    @overtoneOscillators = Array.new(@overtones.length)
    i = 0
    while i < @overtones.length do
      @overtoneOscillators[i] = @oscillator.clone
      @overtoneOscillators[i].frequency = @oscillator.frequency * (i + 2)
      @overtoneOscillators[i].amplitude = @overtones[i]
      i += 1
    end
  end
  
  def updateFrequencies
    currentVibratoSample = @vibratoLFO.nextSample()
    vibratoDelta = currentVibratoSample - @prevVibratoSample
    @prevVibratoSample = currentVibratoSample
  
    # Adjust frequency of the oscillators by the vibrato delta
    @oscillator.frequency += vibratoDelta
    (0..@overtones.length - 1).each do |i|
      @overtoneOscillators[i].frequency = @oscillator.frequency * (i + 2)
    end
  end
  
  def updateAmplitudes
    currentVolumeSample = @volumeLFO.nextSample()
    volumeDelta = currentVolumeSample - @prevVolumeSample
    @prevVolumeSample = currentVolumeSample
    
    @oscillator.amplitude += volumeDelta
    if @oscillator.amplitude > 1.0
      @oscillator.amplitude = 1.0
    end
    
    @overtoneOscillators.each do |o|
      o.amplitude += volumeDelta
      if o.amplitude > 1.0
        o.amplitude = 1.0
      end
    end
  end
  
  def nextSample
    sample = 0.0
    
    if @note != nil && @sampleIndex < @noteSampleLength
      
      if @vibratoLFO != nil
        updateFrequencies()
      end
      
      if @volumeLFO != nil
        updateAmplitudes()
      end
      
      sample = @oscillator.nextSample()
      
      @overtoneOscillators.each do |o|
        sample += o.nextSample()
      end
      sample = sample / (@overtones.length + 1)
      
      @sampleIndex += 1
      
      if(@sampleIndex >= @noteSampleLength)
        @note = nil
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

  def note=(newNote)
    if(newNote != nil)
      @note = newNote
      @oscillator.frequency = newNote.frequency
      
      (0..@overtoneOscillators.length - 1).each do |i|
        @overtoneOscillators[i].frequency = newNote.frequency * (i + 2)
      end
      
      @sampleIndex = 0
      @noteSampleLength = @samplesPerBeat * (4.0 / newNote.duration)
    end
  end
  
  attr_reader :tempo, :beatsPerMinute, :overtones, :note, :noteSampleLength, :samplesPerBeat
end