require "bitmap"

describe Bitmap do

  it 'insantiates @bitmap with input dimentions' do
    bmap = Bitmap.new(2, 3)
    expect(bmap.bitmap).to eq([["O", "O", "O"], ["O", "O", "O"]])
  end

  it 'resets the @bitmap' do
    bmap = Bitmap.new(2, 3, "B")
    bmap.clear
    expect(bmap.bitmap).to eq([["O", "O", "O"], ["O", "O", "O"]])
  end

  it 'shows the @bitmap' do
    bmap = Bitmap.new(2, 3)
    expect(bmap.show).to eq("OOO\nOOO\n")
  end

  it 'changes a pixel colour' do
    bmap = Bitmap.new(2, 3)
    bmap.pixel_change(1, 2, "B")
    expect(bmap.bitmap).to eq([["O", "O", "O"], ["B", "O", "O"]])
  end

  it 'changes a pixel colour can be shown' do
    bmap = Bitmap.new(2, 3)
    bmap.pixel_change(3, 2, "B")
    expect(bmap.show).to eq("OOO\nOOB\n")
  end
end
