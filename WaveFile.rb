=begin
WAV File Specification
FROM http://ccrma.stanford.edu/courses/422/projects/WaveFormat/
The canonical WAVE format starts with the RIFF header:
0         4   ChunkID          Contains the letters "RIFF" in ASCII form
                               (0x52494646 big-endian form).
4         4   ChunkSize        36 + SubChunk2Size, or more precisely:
                               4 + (8 + SubChunk1Size) + (8 + SubChunk2Size)
                               This is the size of the rest of the chunk 
                               following this number.  This is the size of the 
                               entire file in bytes minus 8 bytes for the
                               two fields not included in this count:
                               ChunkID and ChunkSize.
8         4   Format           Contains the letters "WAVE"
                               (0x57415645 big-endian form).

The "WAVE" format consists of two subchunks: "fmt " and "data":
The "fmt " subchunk describes the sound data's format:
12        4   Subchunk1ID      Contains the letters "fmt "
                               (0x666d7420 big-endian form).
16        4   Subchunk1Size    16 for PCM.  This is the size of the
                               rest of the Subchunk which follows this number.
20        2   AudioFormat      PCM = 1 (i.e. Linear quantization)
                               Values other than 1 indicate some 
                               form of compression.
22        2   NumChannels      Mono = 1, Stereo = 2, etc.
24        4   SampleRate       8000, 44100, etc.
28        4   ByteRate         == SampleRate * NumChannels * BitsPerSample/8
32        2   BlockAlign       == NumChannels * BitsPerSample/8
                               The number of bytes for one sample including
                               all channels. I wonder what happens when
                               this number isn't an integer?
34        2   BitsPerSample    8 bits = 8, 16 bits = 16, etc.

The "data" subchunk contains the size of the data and the actual sound:
36        4   Subchunk2ID      Contains the letters "data"
                               (0x64617461 big-endian form).
40        4   Subchunk2Size    == NumSamples * NumChannels * BitsPerSample/8
                               This is the number of bytes in the data.
                               You can also think of this as the size
                               of the read of the subchunk following this 
                               number.
44        *   Data             The actual sound data.
=end

class WaveFile
  CHUNK_ID = "RIFF"
  FORMAT = "WAVE"
  SUB_CHUNK1_ID = "fmt "
  SUB_CHUNK1_SIZE = 16
  AUDIO_FORMAT = 1
  SUB_CHUNK2_ID = "data"
  HEADER_SIZE = 36
  
  def initialize(numChannels, sampleRate, bitsPerSample)
    @numChannels = numChannels
    @sampleRate = sampleRate
    @bitsPerSample = bitsPerSample
    
    @byteRate = sampleRate * numChannels * (bitsPerSample / 8)
    @blockAlign = numChannels * (bitsPerSample / 8)
    @sampleData = []
    @chunkSize = HEADER_SIZE + 0
  end
  
  def save(path)
    # All numeric values should be saved in little-endian format
    
    sampleDataSize = @sampleData.length * @numChannels * (@bitsPerSample / 8)
    
    fileContents = CHUNK_ID
    fileContents += [HEADER_SIZE + sampleDataSize].pack("V")
    fileContents += FORMAT
    fileContents += SUB_CHUNK1_ID
    fileContents += [SUB_CHUNK1_SIZE].pack("V")
    fileContents += [AUDIO_FORMAT].pack("v")
    fileContents += [@numChannels].pack("v")
    fileContents += [@sampleRate].pack("V")
    fileContents += [@byteRate].pack("V")
    fileContents += [@blockAlign].pack("v")
    fileContents += [@bitsPerSample].pack("v")
    fileContents += SUB_CHUNK2_ID
    fileContents += [sampleDataSize].pack("V")
    
    if @bitsPerSample == 8
      # Samples in 8-bit wave files are stored as a unsigned byte
      # Effective values are 0 to 255
      @sampleData = @sampleData.map {|sample| ((sample * 127.0).to_i) + 127 }
      fileContents += @sampleData.pack("C*")
    elsif @bitsPerSample == 16
      # Samples in 16-bit wave files are stored as a signed little-endian short
      # Effective values are -32768 to 32767
      @sampleData = @sampleData.map {|sample| (sample * 32767.0).to_i }
      fileContents += @sampleData.pack("v*")
    else
      # Throw an error
    end
    
    aFile = File.open(path, "w")
    aFile.syswrite(fileContents)
    aFile.close
    @sampleData
  end
  
  attr_reader :numChannels, :sampleRate, :bitsPerSample, :byteRate, :blockAlign
  attr_writer :sampleData
end