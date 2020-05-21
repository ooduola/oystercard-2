class Journey
  attr_reader :entry_station, :exit_station, :journey_history

  def initialize
    @journey_history = {}
  end

  def start_journey(entry_station)
    @entry_station = entry_station
    @journey_history[:"entry_station"] = entry_station
  end

  def finish_journey(exit_station)
    @exit_station = exit_station
    @journey_history[:"exit_station"] = exit_station
  end
end
