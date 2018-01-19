require_relative "bitmap"

class BitmapEditor
  attr_accessor :bitmap
  def initialize
    @bitmap = nil
  end

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp.split
      case line[0].upcase
      when "I"
        @bitmap = Bitmap.new(line[1].to_i, line[2].to_i)
      when "S"
        check_bitmap
        print @bitmap.show
      when "C"
        check_bitmap
        @bitmap.clear
      when "L"
        check_bitmap
        @bitmap.pixel_change(line[1].to_i, line[2].to_i, line[3])
      when "V"
        check_bitmap
        @bitmap.vertical_change(line[1].to_i, line[2].to_i, line[3].to_i, line[4])
      when "H"
        check_bitmap
        @bitmap.horizontal_change(line[1].to_i, line[2].to_i, line[3].to_i, line[4])
      else
          puts 'unrecognised command :('
      end
    end
  end

  private

  def check_bitmap
    raise 'You need to create a bitmap first' if @bitmap == nil
  end

end
