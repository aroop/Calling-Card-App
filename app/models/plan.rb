class Plan < ActiveRecord::Base
  
  has_many :users
  
  has_many :subscriptions
  
  def amount
    (price * minutes)/100
  end
  
  def amount_in_cents
    (price * minutes)
  end
  
end
