class Journey
  attr_reader :current_journey

  def initialize
    @current_journey = {}
  end

  def start_journey(entry_station)
    @entry_station = entry_station
    @current_journey[:"entry_station"] = entry_station
    @in_journey = true
  end

  def finish_journey(exit_station)
    @exit_station = exit_station
    @current_journey[:"exit_station"] = exit_station
    @in_journey = false
  end

  def in_journey?

    @in_journey

  end
end
