class PracticeEditor
  attr_accessor :lines
  
  def initialize
    @bitmap = Bitmap.new(3,2)
    @lines = []
  end

  def run
    @lines.each do |line|
      line = line.chomp
      case line
      when 'S'
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
