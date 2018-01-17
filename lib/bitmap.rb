class Bitmap
  attr_accessor :bitmap
  attr_reader :m, :n

  def initialize(m, n, c = "O")
    check_m(m)
    check_n(n)
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
    check_x(x)
    check_y(y)
    @bitmap[y-1][x-1] = c.upcase
  end

  def vertical_change(x, y1, y2, c)
    check_x(x)
    check_y1(y1)
    check_y2(y2)
    (y1..y2).each do |e|
      @bitmap[e-1][x-1] = c.upcase
    end
  end

  def horizontal_change(x1, x2, y, c)
    check_x1(x1)
    check_x2(x2)
    check_y(y)
    (x1..x2).each do |e|
      @bitmap[y-1][e-1] = c.upcase
    end
  end

  private

  def check_m(m)
    raise 'Your m coordinate must be an integer' if m % 1 != 0
    raise 'Your m length must be between 1 - 250' if m > 250 || m < 1
  end

  def check_n(n)
    raise 'Your n coordinate must be an integer' if n % 1 != 0
    raise 'Your n depth must be between 1 - 250' if n > 250 || n < 1
  end

  def check_x(x)
    raise 'Your x coordinate must be an integer' if x % 1 != 0
    raise 'Your x coordinate is out of range' if x > @m || x < 1
  end

  def check_y(y)
    raise 'Your y coordinate must be an integer' if y % 1 != 0
    raise 'Your y coordinate is out of range' if y > @n || y < 1
  end

  def check_x1(x1)
    raise 'Your x1 coordinate must be an integer' if x1 % 1 != 0
    raise 'Your x1 coordinate is out of range' if x1 > @m || x1 < 1
  end

  def check_x2(x2)
    raise 'Your x2 coordinate must be an integer' if x2 % 1 != 0
    raise 'Your x2 coordinate is out of range' if x2 > @m || x2 < 1
  end

  def check_y1(y1)
    raise 'Your y1 coordinate must be an integer' if y1 % 1 != 0
    raise 'Your y1 coordinate is out of range' if y1 > @n || y1 < 1
  end

  def check_y2(y2)
    raise 'Your y2 coordinate must be an integer' if y2 % 1 != 0
    raise 'Your y2 coordinate is out of range' if y2 > @n || y2 < 1
  end


end
