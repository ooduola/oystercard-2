require 'oyster'

describe Oystercard do
  it 'Test if card responds to balance method' do
    expect(subject).to respond_to(:balance)
  end
end
