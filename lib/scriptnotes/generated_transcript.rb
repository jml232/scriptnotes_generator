class GeneratedTranscript
  attr_accessor :text,:name
  
  def initialize
    @name = "Scriptnotes_#{Time.now.to_i}.txt"
    generate_text
  end

  def save
    self.save! unless File.file?("generated_transcripts/#{@name}")
  end

  def save!
    out_file = File.new("generated_transcripts/#{@name}","w")
    outfile.puts(@text)
    outfile.close
  end
end

