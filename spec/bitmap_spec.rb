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
end
