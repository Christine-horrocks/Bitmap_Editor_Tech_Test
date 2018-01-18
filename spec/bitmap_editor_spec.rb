require "bitmap_editor"
require "bitmap"

describe BitmapEditor do

  it 'returns error if incorrect file' do
    editor = BitmapEditor.new
    filename = "show.txt"
    content = ["S"]
    allow(File).to receive(:open).with(filename).and_return(content)
    expect { editor.run("show.txt") }.to output("There is no image\n").to_stdout
  end



end
