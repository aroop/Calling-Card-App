class User < ActiveRecord::Base
  
  acts_as_authentic
  
  has_many :pinless_numbers

	has_many :speeddial_numbers
	
	def deliver_password_reset_instructions!  
    reset_perishable_token!  
    Notifier.deliver_password_reset_instructions(self)  
  end
  
end