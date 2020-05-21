require 'journey'

describe Journey do

  let(:entry_station) { "London Bridge" }
  let(:exit_station) {"New Cross"}

  it 'responds to in_journey?' do
    expect(subject).to respond_to(:in_journey?)
  end


  context '#start_journey' do
    it 'takes a entry station as an argument' do
      expect(subject).to respond_to(:start_journey).with(1).argument
    end

    it 'records entry station' do
      subject.start_journey(entry_station)
      expect(subject.current_journey[:"entry_station"]).to eq(entry_station)
    end
  end

  context '#finish_journey' do
    it 'takes exit station as argument' do
      expect(subject).to respond_to(:finish_journey).with(1).argument
    end

    it 'returns exit station' do
      subject.finish_journey(exit_station)
      expect(subject.current_journey[:"exit_station"] ).to eq(exit_station)
    end
  end

  context '#current_journey' do
    it 'does not have any journeys stored on initialize' do
      expect(subject.current_journey).to be_empty
    end

    it 'stores entry and exit stations in a hash' do
      subject.start_journey(entry_station)
      subject.finish_journey(exit_station)
      expect(subject.current_journey).to eq(
        {:"entry_station" => entry_station,
          :"exit_station" => exit_station}
        )
    end
  end

  context '#in_journey?' do
    it 'returns true after start journey' do
      subject.start_journey(entry_station)
      expect(subject.in_journey?).to eq(true)
    end

    it 'returns false after finish journey' do
      subject.finish_journey(exit_station)
      expect(subject.in_journey?).to eq(false)
    end
  end
end
