class User < ActiveRecord::Base

  acts_as_authentic

  attr_accessor :creditcard

  #Association
  has_one :subscription, :dependent => :destroy
  
  has_many :pinless_numbers
	has_many :speeddial_numbers
	has_many :cdrs
	belongs_to :plan

  #Validations
  before_validation_on_create :generate_pin 

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

  validates_presence_of     :pin
  validates_uniqueness_of   :pin
  validates_length_of       :pin,    :within => 4..14

  validate_on_create        :store_card
  validate_on_create        :valid_subscription?

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
  
  def store_card
    @response = if billing_id.blank?
      GATEWAY.store(creditcard)
    else
      GATEWAY.update(billing_id, creditcard)
    end
    
    if @response.success?
      self.card_number = creditcard.display_number
      self.card_expiration = "%02d-%d" % [creditcard.expiry_date.month, creditcard.expiry_date.year]
      self.billing_id = @response.params['customer_vault_id']
      true
    else
      errors.add_to_base(@response.message)
      false
    end
  end
  
  def generate_pin(size = 8)
    chars = ((0..9).to_a)
    self.pin = (1..size).collect{|a| chars[rand(chars.size)] }.join
  end
  
  def valid_subscription?
    return if errors.any? # Don't bother with a subscription if there are errors already
    self.build_subscription(:plan => @plan, :next_renewal_at => Time.now, :user => self, :minutes => @plan.minutes)
    if !subscription.valid?
      errors.add_to_base("Error with payment: #{subscription.errors.full_messages.to_sentence}")
      return false
    end
  end
  
end