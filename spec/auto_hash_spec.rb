require 'auto_hash'

describe AutoHash do
  it 'creates deep hashes' do
    debugger
    subject['a']['b']['c'] = 3
    subject.should == { 'a' => { 'b' => { 'c' => 3 } } }
  end

  it 'returns nil for unassigned members' do
    subject['a'].should be_nil
  end
end

