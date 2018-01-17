class Bitmap
  attr_accessor :bitmap
  attr_reader :m, :n

  def initialize(m, n, c = "O")
    @m = m
    @n = n
    @bitmap = Array.new(n) { Array.new(m, c)}
  end

  def clear
    @bitmap = Array.new(n) { Array.new(m, "O")}
  end

  def show
    @bitmap.map { |array| array.push("\n")}.join
  end

  def pixel_change(x, y, c)
    @bitmap[y-1][x-1] = c
  end

  def vertical_change(x, y1, y2, c)
    (y1..y2).each do |e|
      @bitmap[e-1][x-1] = c
    end
  end

end
