def sineBeep
  return SineOscillator.new(44100, 440.0, 0.5).nextSamples(44100)
end

def squareBeep
  return SquareOscillator.new(44100, 440.0, 0.5).nextSamples(44100)
end

def sawtoothBeep
  return SawtoothOscillator.new(44100, 440.0, 0.5).nextSamples(44100)
end

def noiseBeep
  return NoiseOscillator.new(44100, 440.0, 0.5).nextSamples(44100)
end

def majorScale
  bpm = 140
  saw = Instrument.new(120, SineOscillator.new(44100, 220.0, 0.5), [], nil, nil)
  
  t = Track.new(saw)
  t.notes << Note.new("A", 4, 4)
  t.notes << Note.new("B", 4, 4)
  t.notes << Note.new("C#", 4, 4)
  t.notes << Note.new("D", 4, 4)
  t.notes << Note.new("E", 4, 4)
  t.notes << Note.new("F#", 4, 4)
  t.notes << Note.new("G#", 4, 4)
  t.notes << Note.new("A", 5, 4)
  
  return t.nextSamples(t.sampleLength)
end

def minorScale
  bpm = 140
  saw = Instrument.new(120, SineOscillator.new(44100, 220.0, 0.5), [], nil, nil)
  
  t = Track.new(saw)
  t.notes << Note.new("A", 3, 4)
  t.notes << Note.new("B", 3, 4)
  t.notes << Note.new("C", 3, 4)
  t.notes << Note.new("D", 3, 4)
  t.notes << Note.new("E", 3, 4)
  t.notes << Note.new("F", 3, 4)
  t.notes << Note.new("G#", 3, 4)
  t.notes << Note.new("A", 4, 4)
  
  return t.nextSamples(t.sampleLength)
end

def vibratoExample
  normal = Instrument.new(120, SawtoothOscillator.new(44100, 220.0, 0.3), [], nil, nil)
  vibrato = Instrument.new(120, SawtoothOscillator.new(44100, 220.0, 0.3), [], SineOscillator.new(44100, 9.0, 15.0), nil)

  normalTrack = Track.new(normal)
  normalTrack.notes << Note.new("A", 3, 1)

  vibratoTrack = Track.new(vibrato)
  vibratoTrack.notes << Note.new("", 3, 1)
  vibratoTrack.notes << Note.new("A", 3, 1)
  
  s = Song.new()
  s.tracks = [normalTrack, vibratoTrack]
  
  return s.nextSamples(s.sampleLength)
end

def tremoloExample
  normal = Instrument.new(120, SawtoothOscillator.new(44100, 220.0, 0.3), [], nil, nil)
  tremolo = Instrument.new(120, SawtoothOscillator.new(44100, 220.0, 0.3), [], nil, SineOscillator.new(44100, 5.0, 0.3))

  normalTrack = Track.new(normal)
  normalTrack.notes << Note.new("A", 3, 1)

  tremoloTrack = Track.new(tremolo)
  tremoloTrack.notes << Note.new("", 3, 1)
  tremoloTrack.notes << Note.new("A", 3, 1)
  
  s = Song.new()
  s.tracks = [normalTrack, tremoloTrack]
  
  return s.nextSamples(s.sampleLength)
end