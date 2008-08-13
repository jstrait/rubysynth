require 'MusicTheory.rb'

class Note
  MIDDLEA_FREQUENCY = 440.0
  MIDDLE_OCTAVE = 4.0
  
  def initialize(noteName, octave, duration)
    @noteName = noteName
    @octave = octave
    @duration = duration
    
    if @noteName != ""
      octaveMultiplier = 2.0 ** (octave - MIDDLE_OCTAVE)
      noteRatio = MusicTheory.noteRatio(MusicTheory.enharmonicEquivalent(noteName)) * octaveMultiplier
      @frequency = noteRatio * MIDDLEA_FREQUENCY
    else
      @frequency = 0.0
    end
  end
  
  attr_reader :noteName, :octave, :duration, :frequency
end