require 'station'

describe Station do 

  let(:station_name) { "London Bridge" }
  let(:station_zone) { "Zone 1" }
  let(:subject) { Station.new(station_name, station_zone) }

  it 'Station accepts 2 arguments' do
    expect(Station).to respond_to(:new).with(2).argument
  end

  context '#name' do
    it 'returns the value of argument input' do
      expect(subject.name).to eq(station_name)
    end
  end

  context '#zone' do
    it 'returns the value of zone in second input argument' do
      expect(subject.zone).to eq(station_zone)
    end
  end
end
