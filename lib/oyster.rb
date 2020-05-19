class Oystercard

  attr_reader :balance, :in_journey
  DEFAULT_BALANCE_VALUE = 0
  MINIUM_BALANCE = 1

  def initialize(default_balance = DEFAULT_BALANCE_VALUE)
     @balance = default_balance
     @in_journey = false
   end

  def top_up(top_up_value)
   #@top_up_value = top_up_value
   @balance += top_up_value
   raise RuntimeError if max_value?
  end

  def deduct

  end

  def touch_in
    # fail "Error" if
    raise "Error" if balance_checker?
    @in_journey = true

  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  private

  def balance_checker?
    @balance < MINIUM_BALANCE
  end

  def max_value?
    @balance > 90 #|| @top_up_value > 90
  end

end
