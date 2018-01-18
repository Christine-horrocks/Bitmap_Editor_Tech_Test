require "bitmap_editor"
require "bitmap"

describe BitmapEditor do

  it "instantiates a bitmap" do
    editor = BitmapEditor.new
    filename = "show.txt"
    content = ["I 2 3"]
    allow(File).to receive(:open).with(filename).and_return(content)
    editor.run("show.txt")
    expect(editor.bitmap.bitmap).to eq([["O", "O"], ["O", "O"], ["O", "O"]])
  end

  it 'shows the bit map with command S' do
    editor = BitmapEditor.new
    filename = "show.txt"
    content = ["I 3 2", "S"]
    allow(File).to receive(:open).with(filename).and_return(content)
    expect { editor.run("show.txt") }.to output("OOO\nOOO\n").to_stdout
  end

  it 'still works with command lowercase' do
    editor = BitmapEditor.new
    filename = "show.txt"
    content = ["I 3 2", "s"]
    allow(File).to receive(:open).with(filename).and_return(content)
    expect { editor.run("show.txt") }.to output("OOO\nOOO\n").to_stdout
  end

  it 'raises an error if command letter not valid' do
    editor = BitmapEditor.new
    filename = "show.txt"
    content = ["P"]
    allow(File).to receive(:open).with(filename).and_return(content)
    expect { editor.run("show.txt") }.to output("unrecognised command :(\n").to_stdout
  end

  it "clears the bitmap" do
    editor = BitmapEditor.new
    filename = "show.txt"
    content = ["I 3 2", "C"]
    allow(File).to receive(:open).with(filename).and_return(content)
    editor.run("show.txt")
    expect(editor.bitmap.bitmap).to eq([["O", "O", "O"], ["O", "O", "O"]])
  end

end
