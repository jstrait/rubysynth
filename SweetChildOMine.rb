def SweetChildOMine
  bpm = 140
  lead = Instrument.new(bpm, SawtoothOscillator.new(44100, 220.0, 0.3), [], nil, nil)
    
  leadTrack = Track.new(lead)
  2.times {
    leadTrack.notes << Note.new("A", 3, 8)
    leadTrack.notes << Note.new("A", 4, 8)
    leadTrack.notes << Note.new("E", 3, 8)
    leadTrack.notes << Note.new("D", 3, 8)
    leadTrack.notes << Note.new("D", 4, 8)
    leadTrack.notes << Note.new("E", 3, 8)
    leadTrack.notes << Note.new("C#", 4, 8)
    leadTrack.notes << Note.new("E", 3, 8)
  }
  2.times {
    leadTrack.notes << Note.new("B", 3, 8)
    leadTrack.notes << Note.new("A", 4, 8)
    leadTrack.notes << Note.new("E", 3, 8)
    leadTrack.notes << Note.new("D", 3, 8)
    leadTrack.notes << Note.new("D", 4, 8)
    leadTrack.notes << Note.new("E", 3, 8)
    leadTrack.notes << Note.new("C#", 4, 8)
    leadTrack.notes << Note.new("E", 3, 8)
  }
  2.times {
    leadTrack.notes << Note.new("D", 3, 8)
    leadTrack.notes << Note.new("A", 4, 8)
    leadTrack.notes << Note.new("E", 3, 8)
    leadTrack.notes << Note.new("D", 3, 8)
    leadTrack.notes << Note.new("D", 4, 8)
    leadTrack.notes << Note.new("E", 3, 8)
    leadTrack.notes << Note.new("C#", 4, 8)
    leadTrack.notes << Note.new("E", 3, 8)
  }
  2.times {
    leadTrack.notes << Note.new("A", 3, 8)
    leadTrack.notes << Note.new("A", 4, 8)
    leadTrack.notes << Note.new("E", 3, 8)
    leadTrack.notes << Note.new("D", 3, 8)
    leadTrack.notes << Note.new("D", 4, 8)
    leadTrack.notes << Note.new("E", 3, 8)
    leadTrack.notes << Note.new("C#", 4, 8)
    leadTrack.notes << Note.new("E", 3, 8)
  }
  leadTrack.notes << Note.new("A", 3, 2)

  
  s = Song.new()
  s.tracks = [leadTrack]
  
  return s.nextSamples(s.sampleLength)
end