require "bitmap_editor"
require "bitmap"

describe BitmapEditor do

  before(:all) do
    @filename = "show.txt"
  end

  it 'indicates if command letter not valid' do
    content = ["P"]
    allow(File).to receive(:open).with(@filename).and_return(content)
    expect { subject.run(@filename) }.to output("unrecognised command :(\n").to_stdout
  end

  it 'instantiates a bitmap with command I' do
    content = ["I 2 3"]
    allow(File).to receive(:open).with(@filename).and_return(content)
    subject.run(@filename)
    expect(subject.bitmap.bitmap).to eq([["O", "O"], ["O", "O"], ["O", "O"]])
  end

  it 'shows the bitmap with command S' do
    content = ["I 3 2", "S"]
    allow(File).to receive(:open).with(@filename).and_return(content)
    expect { subject.run(@filename) }.to output("OOO\nOOO\n").to_stdout
  end

  it 'still works with command lowercase' do
    content = ["I 3 2", "s"]
    allow(File).to receive(:open).with(@filename).and_return(content)
    expect { subject.run(@filename) }.to output("OOO\nOOO\n").to_stdout
  end

  it 'clears the bitmap with command C' do
    content = ["I 3 2", "C"]
    allow(File).to receive(:open).with(@filename).and_return(content)
    subject.run(@filename)
    expect(subject.bitmap.bitmap).to eq([["O", "O", "O"], ["O", "O", "O"]])
  end

  it 'colours a pixel with command L' do
    content = ["I 3 2", "L 2 2 B"]
    allow(File).to receive(:open).with(@filename).and_return(content)
    subject.run(@filename)
    expect(subject.bitmap.bitmap).to eq([["O", "O", "O"], ["O", "B", "O"]])
  end

  it 'colours a vertical with command V' do
    content = ["I 3 3", "V 2 1 3 B"]
    allow(File).to receive(:open).with(@filename).and_return(content)
    subject.run(@filename)
    expect(subject.bitmap.bitmap).to eq([["O", "B", "O"], ["O", "B", "O"], ["O", "B", "O"]])
  end

  it 'colours a horizontal with command H' do
    content = ["I 3 2", "H 1 2 2 B"]
    allow(File).to receive(:open).with(@filename).and_return(content)
    subject.run(@filename)
    expect(subject.bitmap.bitmap).to eq([["O", "O", "O"], ["B", "B", "O"]])
  end

  it 'raises and error if there is no bitmap' do
    content = ["H 1 2 2 B"]
    allow(File).to receive(:open).with(@filename).and_return(content)
    expect { subject.run(@filename) }.to raise_error 'You need to create a bitmap first'
  end

end
