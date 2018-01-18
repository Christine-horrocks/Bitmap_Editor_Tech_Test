class PracticeEditor

  def initialize
    @bitmap = Bitmap.new(3,2)
  end

  def run
    lines = ["S"]
    lines.each do |line|
      line = line.chomp
      case line
      when 'S'
          puts "There is no image"
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
