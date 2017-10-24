class Transfer
  attr_reader :amount, :sender, :receiver
  attr_accessor :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? == false
      return "Transaction rejected. Please check your account balance."
    else
      receiver.bank_account.balance = (receiver.bank_acount.balance + amount)
      sender.bank_account.balance = (sender.bank_account.balance - amount)
      self.status = "complete"
    end
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    end
  end

end
