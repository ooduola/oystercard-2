# this is linking to journey.rb
require_relative 'journey'

class Oystercard

  attr_reader :balance, :entry_station, :journeys, :exit_station
  DEFAULT_BALANCE_VALUE = 0
  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize(default_balance = DEFAULT_BALANCE_VALUE)
    @balance = default_balance
    @journeys = []
  end

  def top_up(top_up_balance)
    raise RuntimeError if max_value(top_up_balance)

    @balance += top_up_balance
    "Your balance has been topped up by #{top_up_balance}"
  end

  def touch_in(entry_station)
    raise "You're balance is too low." if balance_checker
    @entry_station = entry_station
    # this is from Journey class:
    @journey = Journey.new
    @journey.start_journey(entry_station)
  end

  def touch_out(exit_station)
    deduct_fare
    @exit_station = exit_station
    @journeys << { entry_station: entry_station, exit_station: exit_station }
    @entry_station = nil
    # this is from Journey class:
    @journey.finish_journey(exit_station)
  end

  def in_journey?
   !!@entry_station
  end

  private

  def max_value(top_up_balance)
    @balance + top_up_balance > MAXIMUM_BALANCE
  end

  def deduct_fare
    @balance -= MINIMUM_FARE
    "Your balance has been deducted by #{MINIMUM_FARE}"
  end

  def balance_checker
    @balance < MINIMUM_BALANCE
  end

end
