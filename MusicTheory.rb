class MusicTheory
  NOTE_RATIOS =
  {
    "A"  => 1.0,
    "A#" => 16.0 / 15.0,
    "B"  => 9.0 / 8.0,
    "C"  => 6.0 / 5.0,
    "C#" => 5.0 / 4.0,
    "D"  => 4.0 / 3.0,
    "D#" => 45.0 / 32.0,
    "E"  => 3.0 / 2.0,
    "F"  => 8.0 / 5.0,
    "F#" => 5.0 / 3.0,
    "G"  => 9.0 / 5.0,
    "G#" => 15.0 / 8.0
  }
  
  ENHARMONIC_EQUIVALENTS =
  {
    "A"   => "A",
    "G##" => "A",
    "Bbb" => "A",
    
    "A#"  => "A#",
    "Bb"  => "A#",
    "Cbb" => "A#",
    
    "B"   => "B",
    "A##" => "B",
    "Cb"  => "B",
    
    "C"   => "C",
    "B#"  => "C",
    "Dbb" => "C",
    
    "C#"  => "C#",
    "B##" => "C#",
    "Db"  => "C#",
    
    "D"   => "D",
    "C##" => "D",
    "Ebb" => "D",
    
    "D#"  => "D#",
    "Eb"  => "D#",
    "Fbb" => "D#",
    
    "E"   => "E",
    "D##" => "E",
    "Fb"  => "E",
    
    "F"   => "F",
    "E#"  => "F",
    "Gbb" => "F",
    
    "F#"  => "F#",
    "E##" => "F#",
    "Gb"  => "F#",
    
    "G"   => "G",
    "F##" => "G",
    "Abb" => "G",
    
    "G#"  => "G#",
    "Ab"  => "G#"
  }
  
  def MusicTheory.noteRatio(noteName)
    NOTE_RATIOS[noteName]
  end

  def MusicTheory.enharmonicEquivalent(noteName)
    ENHARMONIC_EQUIVALENTS[noteName]
  end
end