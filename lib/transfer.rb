class Transfer
  attr_reader :amount, :sender, :receiver
  attr_accessor :status

#initializes with sender, receiver, always with status = "pending", and amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

#can check that both accounts are valid
  def valid?
#calls on the sender and receiver's #valid? methods
    sender.valid? && receiver.valid?
  end

#can execute successful transaction btwn two accounts
  def execute_transaction
#each transfer can only happen once
    if valid? && sender.balance > amount && self.status == "pending"
      receiver.balance += amount
      sender.balance -= amount
      self.status = "complete"
    else
#rejects a transfer if the sender doesn
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

#can reverse a transfer between 2 accounts
  def reverse_transfer
#can only reverse executed accounts
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    end
  end

end
