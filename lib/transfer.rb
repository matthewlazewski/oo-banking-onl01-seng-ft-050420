class Transfer
  attr_accessor :sender, :receiver, :amount, :status 

  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount 
    @status = "pending"
  end 

  def valid?
    self.sender.valid? && self.receiver.valid? ? true : false 
  end 

  def execute_transaction
    if valid?
      if self.sender.balance > self.amount && status == "pending"
        self.sender.balance -= self.amount 
        self.receiver.balance += self.amount 
        self.status = "complete"
      else 
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end 
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end 

  def reverse_transfer
    if @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount 
      @status = "reversed"
    end
  end  


end
