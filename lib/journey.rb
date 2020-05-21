class Journey

  attr_reader :entry_station, :exit_station

  def start_journey(entry_station)

    @entry_station = entry_station
    
  end

  def finish_journey(exit_station)
    @exit_station = exit_station

  end

end
