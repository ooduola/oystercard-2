require 'oystercard'

describe Oystercard do
  let(:card) { Oystercard.new(50) }
  let(:station) { double :station }
  let(:exit_station) { double :station }
  let(:entry_station) { double :station }
  # let(:touch_in_card) do 
  #   card.touch_in(entry_station)
  # end

  it { is_expected.to respond_to :balance }

  it 'returns empty list by default' do
    expect(card.journeys).to be_empty
  end

  it 'return completed journey' do
    card.touch_in(entry_station)
    card.touch_out(exit_station)
    expect(card.journeys).to eq [{entry_station: entry_station, exit_station: exit_station}]
  end

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
        card.touch_in(station)
        expect {card.touch_out(exit_station)}.to change{card.balance}.by(-Oystercard::MINIMUM_FARE)
      end

      it 'should change #entry_station to nil' do
        card.touch_in(station)
        card.touch_out(exit_station)
        expect(card.entry_station).to eq nil
      end

      it 'stores exit station' do
        card.touch_in(entry_station)
        card.touch_out(exit_station)
        expect(card.exit_station).to eq exit_station
      end
    end

    context '#fare' do
      it 'responds to card object' do
        expect(subject).to respond_to(:fare)
      end

      it 'returns the minimum fare value on completed journey' do
        minimum_fare = Oystercard::MINIMUM_FARE
        card.touch_in(entry_station)
        card.touch_out(exit_station)
        expect(card.fare).to eq(minimum_fare)
      end
    end
end
