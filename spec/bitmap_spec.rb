require "bitmap"

describe Bitmap do

  context "insantiation" do

    it 'insantiates @bitmap with input dimentions' do
      bmap = Bitmap.new(3, 2)
      expect(bmap.bitmap).to eq([["O", "O", "O"], ["O", "O", "O"]])
    end

    it 'raises an error if m not integer' do
      expect {Bitmap.new("p", 3)}.to raise_error 'Your m coordinate must be an integer'
    end

    it 'raises an error if m is under 1' do
      expect {Bitmap.new(0, 3)}.to raise_error 'Your m length must be between 1 - 250'
    end

    it 'raises an error if m over 250' do
      expect {Bitmap.new(255, 3)}.to raise_error 'Your m length must be between 1 - 250'
    end

    it 'raises an error if n not integer' do
      expect {Bitmap.new(3, "p")}.to raise_error 'Your n coordinate must be an integer'
    end

    it 'raises an error if n is under 1' do
      expect {Bitmap.new(3, 0)}.to raise_error 'Your n depth must be between 1 - 250'
    end

    it 'raises an error if n over 250' do
      expect {Bitmap.new(3, 255)}.to raise_error 'Your n depth must be between 1 - 250'
    end

  end

  context "clear" do

    it 'resets the @bitmap' do
      bmap = Bitmap.new(3, 2, "B")
      bmap.clear
      expect(bmap.bitmap).to eq([["O", "O", "O"], ["O", "O", "O"]])
    end

  end

  context "show" do

    it 'shows the @bitmap' do
      bmap = Bitmap.new(3, 2)
      expect(bmap.show).to eq("OOO\nOOO\n")
    end

  end

  context "pixel change" do

    before(:context) do
     @bmap = Bitmap.new(3, 2)
    end

    it 'changes a pixel colour' do
      @bmap.pixel_change(1, 2, "B")
      expect(@bmap.bitmap).to eq([["O", "O", "O"], ["B", "O", "O"]])
    end

    it 'raises an error if x not integer' do
      expect {@bmap.pixel_change("p", 2, "B")}.to raise_error 'Your x coordinate must be an integer'
    end

    it 'raises an error if x out of range' do
      expect {@bmap.pixel_change(4, 2, "B")}.to raise_error 'Your x coordinate is out of range'
    end

    it 'raises an error if y not integer' do
      expect {@bmap.pixel_change(1, "p", "B")}.to raise_error 'Your y coordinate must be an integer'
    end

    it 'raises an error if y out of range' do
      expect {@bmap.pixel_change(3, 3, "B")}.to raise_error 'Your y coordinate is out of range'
    end

    it 'changes a pixel colour can be shown' do
      bmap = Bitmap.new(3, 2)
      bmap.pixel_change(3, 2, "B")
      expect(bmap.show).to eq("OOO\nOOB\n")
    end

    it 'colour represented by capital letter' do
      bmap = Bitmap.new(3, 2)
      bmap.pixel_change(1, 2, "b")
      expect(bmap.bitmap).to eq([["O", "O", "O"], ["B", "O", "O"]])
    end

  end

  context "vertical_change" do

    before(:context) do
     @bmap = Bitmap.new(3, 2)
    end

    it 'changes a vertical line of pixels colour' do
      @bmap.vertical_change(1, 1, 2, "B")
      expect(@bmap.bitmap).to eq([["B", "O", "O"], ["B", "O", "O"]])
    end

    it 'raises an error if x not integer' do
      expect {@bmap.vertical_change("p", 1, 2, "B")}.to raise_error 'Your x coordinate must be an integer'
    end

    it 'raises an error if x out of range' do
      expect {@bmap.vertical_change(4, 1, 2, "B")}.to raise_error 'Your x coordinate is out of range'
    end

    it 'raises an error if y1 not integer' do
      expect {@bmap.vertical_change(3, "p", 1, "B")}.to raise_error 'Your y1 coordinate must be an integer'
    end

    it 'raises an error if y1 out of range' do
      expect {@bmap.vertical_change(3, 4, 1, "B")}.to raise_error 'Your y1 coordinate is out of range'
    end

    it 'raises an error if y2 not integer' do
      expect {@bmap.vertical_change(3, 1, "p", "B")}.to raise_error 'Your y2 coordinate must be an integer'
    end

    it 'raises an error if y2 out of range' do
      expect {@bmap.vertical_change(3, 1, 4, "B")}.to raise_error 'Your y2 coordinate is out of range'
    end

    it 'colour represented by capital letter' do
      @bmap.vertical_change(1, 1, 2, "b")
      expect(@bmap.bitmap).to eq([["B", "O", "O"], ["B", "O", "O"]])
    end

  end

  context "horizontal change" do

    before(:context) do
     @bmap = Bitmap.new(3, 2)
    end

    it 'changes a horizontal line of pixels colour' do
      @bmap.horizontal_change(1, 3, 1,"B")
      expect(@bmap.bitmap).to eq([["B", "B", "B"], ["O", "O", "O"]])
    end

    it 'raises an error if x1 not integer' do
      expect {@bmap.horizontal_change("p", 2, 1, "B")}.to raise_error 'Your x1 coordinate must be an integer'
    end

    it 'raises an error if x1 out of range' do
      expect {@bmap.horizontal_change(4, 1, 2, "B")}.to raise_error 'Your x1 coordinate is out of range'
    end

    it 'raises an error if x2 not integer' do
      expect {@bmap.horizontal_change(2, "p", 1, "B")}.to raise_error 'Your x2 coordinate must be an integer'
    end

    it 'raises an error if x2 out of range' do
      expect {@bmap.horizontal_change(1, 4, 2, "B")}.to raise_error 'Your x2 coordinate is out of range'
    end

    it 'raises an error if y not integer' do
      expect {@bmap.horizontal_change(1, 2, "p", "B")}.to raise_error 'Your y coordinate must be an integer'
    end

    it 'raises an error if y out of range' do
      expect {@bmap.horizontal_change(1, 2, 4, "B")}.to raise_error 'Your y coordinate is out of range'
    end

    it 'colour represented by capital letter' do
      @bmap.horizontal_change(1, 3, 1,"b")
      expect(@bmap.bitmap).to eq([["B", "B", "B"], ["O", "O", "O"]])
    end

  end

end
