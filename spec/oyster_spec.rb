require 'oyster'

describe Oystercard do
  it 'Test if card responds to balance method' do
    expect(subject).to respond_to(:balance)
  end
end

=begin
An error occurred while loading ./spec/oyster_spec.rb.
Failure/Error:
  describe Oystercard do
  
  end

NameError:
  uninitialized constant Oystercard
# ./spec/oyster_spec.rb:1:in `<top (required)>'
No examples found.
=end