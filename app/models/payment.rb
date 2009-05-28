class Payment < ActiveRecord::Base
  belongs_to :subscription
  belongs_to :user
  
  after_create :send_receipt
  
  serialize :params
  
  def send_receipt
    Notifier.deliver_payment_receipt(self)
  end
  
end