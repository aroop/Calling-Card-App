class Plan < ActiveRecord::Base
  
  has_many :users
  
  def amount
    (price * minutes)/100
  end
  
end
