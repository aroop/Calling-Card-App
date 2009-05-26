class Payment < ActiveRecord::Base
  belongs_to :subscription
  belongs_to :user
  
  after_create :send_receipt
  
  serialize :params
  
  def send_receipt
    Notifier.deliver_payment_receipt(self)
  end
  
  # def process(action, amount = nil) 
  #   result = Payment.new 
  #   result.amount = amount 
  #   result.action = action 
  #   begin 
  #     response = yield gateway 
  # 
  #     result.success   = response.success? 
  #     result.reference = response.authorization 
  #     result.message   = response.message 
  #     result.params    = response.params 
  #     result.test      = response.test? 
  #   rescue ActiveMerchant::ActiveMerchantError => e 
  #     result.success   = false 
  #     result.reference = nil 
  #     result.message   = e.message 
  #     result.params    = {} 
  #     result.test      = gateway.test? 
  #   end 
  # 
  #   result 
  # end   
  
end