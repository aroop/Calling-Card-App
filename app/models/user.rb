class User < ActiveRecord::Base
  
  acts_as_authentic
  
  attr_accessor :creditcard
  
  validate_on_create :validate_card
  validate_on_create :valid_plan?
  
  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login
  
  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100
  validates_uniqueness_of   :email
  
  validates_presence_of     :first_name
  validates_presence_of     :last_name
  
  has_one :voucher, :dependent => :destroy
  
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
  
  def valid_plan?
    errors.add_to_base("Invalid plan selected.") unless @plan
  end
  
end
