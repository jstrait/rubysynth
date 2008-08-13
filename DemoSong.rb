def DemoSong
  bpm = 120
  noiseDrum = Instrument.new(bpm, NoiseOscillator.new(44100, 220.0, 1.0), [])
  synthBass = Instrument.new(bpm, SquareOscillator.new(44100, 220.0, 0.3), [1.0], nil, nil)
  #voice = Instrument.new(bpm, SawtoothOscillator.new(44100, 220.0, 0.3), [], SineOscillator.new(44100, 3.0, 5.0), nil)
  #voice = Instrument.new(bpm, SawtoothOscillator.new(44100, 220.0, 0.3), [], nil, SineOscillator.new(44100, 10.0, 0.3))
  voice = Instrument.new(bpm, SawtoothOscillator.new(44100, 220.0, 0.3), [], nil, nil)
  
  drumTrack = Track.new(noiseDrum)
  2.times {
    7.times {
      drumTrack.notes << Note.new("", 0, 4)
      drumTrack.notes << Note.new("A", 0, 16)
      drumTrack.notes << Note.new("", 0, 16)
      drumTrack.notes << Note.new("", 0, 8)
    }
    drumTrack.notes << Note.new("", 0, 4)
    drumTrack.notes << Note.new("A", 0, 16)
    drumTrack.notes << Note.new("", 0, 16)
    drumTrack.notes << Note.new("A", 0, 32)
    drumTrack.notes << Note.new("", 0, 32)
    drumTrack.notes << Note.new("A", 0, 16)
  }
  4.times {
    3.times {
      drumTrack.notes << Note.new("", 0, 4)
      drumTrack.notes << Note.new("A", 0, 16)
      drumTrack.notes << Note.new("", 0, 16)
      drumTrack.notes << Note.new("", 0, 8)
    }
    drumTrack.notes << Note.new("", 0, 4)
    4.times {
      drumTrack.notes << Note.new("A", 0, 32)
      drumTrack.notes << Note.new("", 0, 32)
    }
  }


  bassTrack = Track.new(synthBass)
  2.times {
    4.times {
      bassTrack.notes << Note.new("A", 1, 16)
      bassTrack.notes << Note.new("", 1, 16)
    }
    4.times {
      bassTrack.notes << Note.new("D", 1, 16)
      bassTrack.notes << Note.new("", 1, 16)
    }
    4.times {
      bassTrack.notes << Note.new("C", 1, 16)
      bassTrack.notes << Note.new("", 1, 16)
    }
    4.times {
      bassTrack.notes << Note.new("B", 1, 16)
      bassTrack.notes << Note.new("", 1, 16)
    }
    4.times {
      bassTrack.notes << Note.new("A", 1, 16)
      bassTrack.notes << Note.new("", 1, 16)
    }
    4.times {
      bassTrack.notes << Note.new("D", 1, 16)
      bassTrack.notes << Note.new("", 1, 16)
    }
    4.times {
      bassTrack.notes << Note.new("C", 1, 16)
      bassTrack.notes << Note.new("", 1, 16)
    }
    3.times {
      bassTrack.notes << Note.new("E", 1, 16)
      bassTrack.notes << Note.new("", 1, 16)
    }
      bassTrack.notes << Note.new("Eb", 1, 16)
      bassTrack.notes << Note.new("E", 1, 16)
  }
  2.times {
    4.times {
      bassTrack.notes << Note.new("A", 1, 16)
      bassTrack.notes << Note.new("", 1, 16)
    }
    4.times {
      bassTrack.notes << Note.new("D", 1, 16)
      bassTrack.notes << Note.new("", 1, 16)
    }
    4.times {
      bassTrack.notes << Note.new("C", 1, 16)
      bassTrack.notes << Note.new("", 1, 16)
    }
    4.times {
      bassTrack.notes << Note.new("B", 1, 16)
      bassTrack.notes << Note.new("", 1, 16)
    }
    4.times {
      bassTrack.notes << Note.new("A", 1, 16)
      bassTrack.notes << Note.new("", 1, 16)
    }
    4.times {
      bassTrack.notes << Note.new("D", 1, 16)
      bassTrack.notes << Note.new("", 1, 16)
    }
    2.times {
      bassTrack.notes << Note.new("C", 1, 16)
      bassTrack.notes << Note.new("", 1, 16)
    }
    2.times {
      bassTrack.notes << Note.new("D", 1, 16)
      bassTrack.notes << Note.new("", 1, 16)
    }
    4.times {
      bassTrack.notes << Note.new("A", 1, 16)
      bassTrack.notes << Note.new("", 1, 16)
    }
  }


  voiceTrack = Track.new(voice)
  2.times {
    voiceTrack.notes << Note.new("A", 3, 4)
    voiceTrack.notes << Note.new("E", 3, 8)
    voiceTrack.notes << Note.new("F#", 3, 4)
    voiceTrack.notes << Note.new("E", 3, 8)
    voiceTrack.notes << Note.new("D", 3, 8)
    voiceTrack.notes << Note.new("E", 3, 4)
    voiceTrack.notes << Note.new("D", 3, 8)
    voiceTrack.notes << Note.new("C", 3, 8)
    voiceTrack.notes << Note.new("E", 3, 2)
    voiceTrack.notes << Note.new("", 3, 8)

    voiceTrack.notes << Note.new("A", 3, 4)
    voiceTrack.notes << Note.new("E", 3, 8)
    voiceTrack.notes << Note.new("F#", 3, 4)
    voiceTrack.notes << Note.new("E", 3, 8)
    voiceTrack.notes << Note.new("D", 3, 8)
    voiceTrack.notes << Note.new("E", 3, 1)
    voiceTrack.notes << Note.new("", 3, 8)
  }
  2.times {
    voiceTrack.notes << Note.new("A", 4, 4)
    voiceTrack.notes << Note.new("F#", 3, 8)
    voiceTrack.notes << Note.new("A", 4, 8)
    voiceTrack.notes << Note.new("B", 4, 8)
    voiceTrack.notes << Note.new("C#", 4, 8)
    voiceTrack.notes << Note.new("B", 4, 8)
    voiceTrack.notes << Note.new("A", 4, 8)
    voiceTrack.notes << Note.new("A", 4, 8)
    voiceTrack.notes << Note.new("A", 4, 8)
    voiceTrack.notes << Note.new("G", 3, 8)
    voiceTrack.notes << Note.new("G", 3, 8)
    voiceTrack.notes << Note.new("E", 3, 2)

    voiceTrack.notes << Note.new("A", 4, 4)
    voiceTrack.notes << Note.new("F#", 3, 8)
    voiceTrack.notes << Note.new("A", 4, 8)
    voiceTrack.notes << Note.new("B", 4, 8)
    voiceTrack.notes << Note.new("C#", 4, 8)
    voiceTrack.notes << Note.new("B", 4, 8)
    voiceTrack.notes << Note.new("A", 4, 8)
    voiceTrack.notes << Note.new("A", 4, 8)
    voiceTrack.notes << Note.new("A", 4, 8)
    voiceTrack.notes << Note.new("G", 3, 8)
    voiceTrack.notes << Note.new("G", 3, 8)
    voiceTrack.notes << Note.new("A", 4, 2)
  }
  
  
  s = Song.new()
  s.tracks = [drumTrack, bassTrack, voiceTrack]
  
  return s.nextSamples(s.sampleLength)
end