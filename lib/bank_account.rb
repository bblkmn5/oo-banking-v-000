class BankAccount
#can't change its name
  attr_reader :name

  attr_accessor :balance, :status

#initializes with a name, always with a balance of 1000, and always with a status of "open"
  def initialize(name, balance = 1000, status = "open")
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(money)
    self.balance = (self.balance + money)
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    if status != "open" || balance == 0
      false
    else
      true
    end
  end

  def close_account
    self.status = "closed"
  end

end
