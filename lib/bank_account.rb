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
    balance
  end

end
