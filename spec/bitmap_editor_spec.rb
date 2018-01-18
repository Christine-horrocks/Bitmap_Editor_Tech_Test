require "bitmap_editor"
require "bitmap"

describe BitmapEditor do

  it 'indicates if command letter not valid' do
    editor = BitmapEditor.new
    filename = "show.txt"
    content = ["P"]
    allow(File).to receive(:open).with(filename).and_return(content)
    expect { editor.run("show.txt") }.to output("unrecognised command :(\n").to_stdout
  end

  it 'instantiates a bitmap with command I' do
    editor = BitmapEditor.new
    filename = "show.txt"
    content = ["I 2 3"]
    allow(File).to receive(:open).with(filename).and_return(content)
    editor.run("show.txt")
    expect(editor.bitmap.bitmap).to eq([["O", "O"], ["O", "O"], ["O", "O"]])
  end

  it 'shows the bitmap with command S' do
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

  it 'clears the bitmap with command C' do
    editor = BitmapEditor.new
    filename = "show.txt"
    content = ["I 3 2", "C"]
    allow(File).to receive(:open).with(filename).and_return(content)
    editor.run("show.txt")
    expect(editor.bitmap.bitmap).to eq([["O", "O", "O"], ["O", "O", "O"]])
  end

  it 'colours a pixel with command L' do
    editor = BitmapEditor.new
    filename = "show.txt"
    content = ["I 3 2", "L 2 2 B"]
    allow(File).to receive(:open).with(filename).and_return(content)
    editor.run("show.txt")
    expect(editor.bitmap.bitmap).to eq([["O", "O", "O"], ["O", "B", "O"]])
  end

  it 'colours a vertical with command V' do
    editor = BitmapEditor.new
    filename = "show.txt"
    content = ["I 3 3", "V 2 1 3 B"]
    allow(File).to receive(:open).with(filename).and_return(content)
    editor.run("show.txt")
    expect(editor.bitmap.bitmap).to eq([["O", "B", "O"], ["O", "B", "O"], ["O", "B", "O"]])
  end

  it 'colours a horizontal with command H' do
    editor = BitmapEditor.new
    filename = "show.txt"
    content = ["I 3 2", "H 1 2 2 B"]
    allow(File).to receive(:open).with(filename).and_return(content)
    editor.run("show.txt")
    expect(editor.bitmap.bitmap).to eq([["O", "O", "O"], ["B", "B", "O"]])
  end

  it 'raises and error if there is no bitmap' do
    editor = BitmapEditor.new
    filename = "show.txt"
    content = ["H 1 2 2 B"]
    allow(File).to receive(:open).with(filename).and_return(content)
    expect {editor.run("show.txt")}.to raise_error 'You need to create a bitmap first'
  end

end
