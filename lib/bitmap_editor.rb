class BitmapEditor

  def initialize
    @bitmap = Bitmap.new(3,2)
  end

  def run(file)
    # return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp.scan /\w/
      case line[0].upcase
      when "S"
          print @bitmap.show
      else
          puts 'unrecognised command :('
      end
    end
  end

  # def s
  #    print @bitmap.show
  # end
  #
  # def c
  #   @bitmap.clear
  # end
end
