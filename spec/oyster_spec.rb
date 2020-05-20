require 'oyster'

describe Oystercard do
  let(:card) { Oystercard.new(50) }
  let(:station) { double :station }

  it { is_expected.to respond_to :balance }

  context '#balance' do
    it 'returns default value of 0' do
      expect(subject.balance).to eq(0)
    end
  end

  context '#top_up' do
    it { is_expected.to respond_to :top_up }
    it 'raise error when balance is over 90' do
      expect { subject.top_up(91) }.to raise_error(RuntimeError)
    end

    it 'return new balance when we add top_up argument' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
     end
   end

   context '#in_journey?' do
    it 'returns false for new card' do
      expect(subject.in_journey?).to eq false
    end
   end

   context '#touch_in' do
    it 'raises an error if below minimum' do
      expect{ subject.touch_in(station) }.to raise_error "You're balance is too low."
    end

    it 'returns in_journey to equal true' do
      card.touch_in(station)
      expect(card).to be_in_journey
    end

     it 'should remember the entry station' do
       card.touch_in(station)
       expect(card.entry_station).to eq station
     end
    end

    context '#touch_out' do
      it 'returns in_journey to equal false' do
        card.touch_in(station)
        expect(subject).not_to be_in_journey
      end

      it 'reduce balance by minimum fare' do
        expect {subject.touch_out}.to change{subject.balance}.by(-Oystercard::MINIMUM_FARE)
      end

      it 'should change #entry_station to nil' do
        card.touch_in(station)
        card.touch_out
        expect(card.entry_station).to eq nil
      end
    end
end
