require 'auto_hash'

describe AutoHash do
  it 'creates deep hashes' do
    subject['a']['b']['c'] = 3
    subject.should == { 'a' => { 'b' => { 'c' => 3 } } }
  end
end

