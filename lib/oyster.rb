class Oystercard

  attr_reader :balance
  DEFAULT_BALANCE_VALUE = 0

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
    @in_journey = true
  end 
  
  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  private

  def max_value?
    @balance > 90 #|| @top_up_value > 90
  end

end
