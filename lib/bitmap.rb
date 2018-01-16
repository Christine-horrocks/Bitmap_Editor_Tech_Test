class Bitmap
  attr_accessor :bitmap
  attr_reader :m, :n

  def initialize(m, n, c = "O")
    @m = m
    @n = n
    @bitmap = Array.new(m) { Array.new(n, c)}
  end

  def clear
    @bitmap = Array.new(m) { Array.new(n, "O")}
  end

  def show
    @bitmap.map { |array| array.push("\n")}.join
  end

  def pixel_change(x, y, c)
    bmap = @bitmap
    bmap[y-1][x-1] = c
  end

end
