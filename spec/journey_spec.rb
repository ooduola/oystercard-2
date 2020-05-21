require 'journey'

describe Journey do

  let(:entry_station) { "London Bridge" }
  let(:exit_station) {"New Cross"}

  context '#start_journey' do
    it 'takes a entry station as an argument' do
      expect(subject).to respond_to(:start_journey).with(1).argument
    end
  end

  context '#finish_journey' do 
    it 'takes exit station as argument' do
      expect(subject).to respond_to(:finish_journey).with(1).argument
    end
  end

  it 'records entry station' do
    subject.start_journey(entry_station)
    expect(subject.entry_station).to eq(entry_station)
  end

  it 'returns exit station' do
    subject.finish_journey(exit_station)
    expect(subject.exit_station).to eq(exit_station)
  end

end

