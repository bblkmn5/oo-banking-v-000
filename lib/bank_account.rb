class BankAccount

  attr_reader :name

  attr_accessor :balance, :status

  def initialize(name, balance = 1000, status = "open")
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(money)
    balance = balance + money
  end

  def display_balance
    "Your balance is #{self.balance}."
  end

  def valid?
    if status != "open" || balance == 0
      false
    else
      true
    end
  end

end
