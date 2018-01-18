require "bitmap_editor"
require "bitmap"

describe BitmapEditor do

  it 'shows the bit map with command S' do
    editor = BitmapEditor.new
    filename = "show.txt"
    content = ["S"]
    allow(File).to receive(:open).with(filename).and_return(content)
    expect { editor.run("show.txt") }.to output("OOO\nOOO\n").to_stdout
  end

  it 'still works with command lowercase' do
    editor = BitmapEditor.new
    filename = "show.txt"
    content = ["s"]
    allow(File).to receive(:open).with(filename).and_return(content)
    expect { editor.run("show.txt") }.to output("OOO\nOOO\n").to_stdout
  end


end
