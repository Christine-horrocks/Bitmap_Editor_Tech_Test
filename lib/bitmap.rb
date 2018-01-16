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
    bmap = @bitmap.map { |array| array.push("\n")}.join
  end

  def pixel_change(x, y, c)
    bmap = @bitmap
    bmap[y-1][x-1] = c
  end

  def vertical_change(x, y1, y2, c)
    bmap = @bitmap
    bmap[y1-1][x-1] = c
    bmap[y2-1][x-1] = c
  end

end
