class Plan < ActiveRecord::Base
  
  has_many :users
  
  has_many :vouchers
  
  def amount
    (price * minutes)/100
  end
  
end
