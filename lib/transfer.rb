class Transfer

  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if sender != nil && receiver != nil
      true
    end
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
    if self.status == "complete"
      receiver.bank_account.balance = (receiver.bank_account.balance - amount)
      sender.bank_account.balance = (sender.bank_account.balance + amount)
      self.status = "reversed"
    end
  end


end
