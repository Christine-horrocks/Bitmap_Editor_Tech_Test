class BitmapEditor
  attr_accessor :bitmap
  def initialize
    @bitmap = nil
  end

  def run(file)
    # return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp.scan /\w/
      case line[0].upcase
      when "I"
        @bitmap = Bitmap.new(line[1].to_i, line[2].to_i)
      when "S"
          print @bitmap.show
      when "C"
        @bitmap.clear
      else
          puts 'unrecognised command :('
      end
    end
  end


end
