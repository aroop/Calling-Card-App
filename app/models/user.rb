class User < ActiveRecord::Base
  
  acts_as_authentic
  
  attr_accessor :creditcard
  
  validate_on_create :validate_card
  
  has_many :pinless_numbers

	has_many :speeddial_numbers
	
	has_many :cdrs
	
	belongs_to :plan
	
	def deliver_password_reset_instructions!  
    reset_perishable_token!  
    Notifier.deliver_password_reset_instructions(self)  
  end
  
  def full_name
      "#{first_name} #{last_name}"
  end
  
  private
  def validate_card
    unless creditcard.valid?
      creditcard.errors.full_messages.each do |message|
        errors.add_to_base message
      end
    end
  end
  
  
end
