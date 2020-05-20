class Oystercard

  attr_reader :balance, :in_journey
  DEFAULT_BALANCE_VALUE = 0
  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize(default_balance = DEFAULT_BALANCE_VALUE)
     @balance = default_balance
     @in_journey = false
   end

  def top_up(top_up_balance)
   @balance += top_up_balance
   puts "Your balance has been topped up by #{top_up_balance}"
   raise RuntimeError if max_value?
  end

  def touch_in
    raise "You're balance is too low." if balance_checker?
    @in_journey = true
  end

  def touch_out
    @balance -= MINIMUM_FARE
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  private

  def deduct(deduct_balance)
    @balance -= deduct_balance
    puts "Your balance has been deducted by #{deduct_balance}"
  end

  def balance_checker?
    @balance < MINIMUM_BALANCE
  end

  def max_value?
    @balance >  MAXIMUM_BALANCE
  end

end
