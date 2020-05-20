require 'oyster'

describe Oystercard do
  it 'Test if card responds to balance method' do
    expect(subject).to respond_to(:balance)
  end
  
  # context '#deduct' do
  #   it 'responds to the deduct method' do
  #     expect(subject).to respond_to(:deduct).with(1).argument
  #   end
    
  #   it 'reduces the balance by value of argument' do
  #     expect{ subject.deduct 5 }.to change{ subject.balance }.by -5
  #   end
  # end

  context '#balance' do
    it 'returns default value of 0' do
      expect(subject.balance).to eq(0)
    end
  end

  context '#top_up' do
    it 'subject respond to top_up method' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end
    it 'raise error when balance in over 90£' do
      expect { subject.top_up(100) > subject.balance}.to raise_error(RuntimeError)
    end

    it 'return new balance when we add top_up argument' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
     end
   end

   context '#in_journey?' do
    it 'responds to the in_journey? method' do
      expect(subject).to respond_to(:in_journey?)
    end

    it 'retruns false for new card' do
      expect(subject.in_journey?).to eq false
    end
   end

   context '#touch_in' do
     it 'responds to Oystercard' do
       expect(subject).to respond_to(:touch_in)
     end

    it 'raises an error if below minimum' do
      expect{ subject.touch_in }.to raise_error "You're balance is too low."
    end

     it 'returns in_journey to equal true' do
       subject.top_up(Oystercard::MINIMUM_BALANCE)
       expect(subject.touch_in).to eq(in_journey = true)
     end
    end

    context '#touch_out' do
      # it 'respond to Oystercard' do
      #   expect(subject).to respond_to(:touch_out)
      # end
      it 'returns in_journey to equal false' do
        expect(subject.touch_out).to eq(in_journey = false)
      end

      it 'reduce balance by minimum fare' do
        expect {subject.touch_out}.to change{subject.balance}.by(-Oystercard::MINIMUM_FARE)
      end
    end
end

# =being
#   An error occurred while loading ./spec/oyster_spec.rb.
#   Failure/Error:
#     describe Oystercard do
#     end
#   NameError:
#     uninitialized constant Oystercard
#   # ./spec/oyster_spec.rb:1:in `<top (required)>'
#   No examples found.
# =end
