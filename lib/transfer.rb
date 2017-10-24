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
      "Transaction rejected. Please check your account balance."
    self.status = "complete"
  end

end
