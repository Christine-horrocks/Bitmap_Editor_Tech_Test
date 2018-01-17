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
    raise 'Your x coordinate is out of range' if x > @m || x < 1
    raise 'Your y coordinate is out of range' if y > @n || y < 1
    @bitmap[y-1][x-1] = c
  end

  def vertical_change(x, y1, y2, c)
    raise 'Your x coordinate is out of range' if x > @m || x < 1
    raise 'Your y1 coordinate is out of range' if y1 > @n || y1 < 1
    raise 'Your y2 coordinate is out of range' if y2 > @n || y2 < 1
    (y1..y2).each do |e|
      @bitmap[e-1][x-1] = c
    end
  end

  def horizontal_change(x1, x2, y, c)
    (x1..x2).each do |e|
      @bitmap[y-1][e-1] = c
    end
  end

end
