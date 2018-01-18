require "practice_editor"

describe PracticeEditor do

  it 'says id there is no image' do
    expect { subject.run }.to output("There is no image\n").to_stdout
  end

end
