class Subscription < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :plan
  has_many    :payments
  
  validate_on_create :charge
  
  protected
  
  def charge
    @response = GATEWAY.purchase(plan.amount_in_cents, user.billing_id)
    if @response.success?
      self.next_renewal_at = Time.now.advance(:months => self.renewal_period)
      self.state = 'active'
      self.payments.build(:user => user, :amount => plan.amount, :transaction_id => @response.authorization, 
                            :test => @response.test?, :params => @response.params, :success => @response.success?, 
                            :message => @response.message)
      true
    else
      errors.add_to_base(@response.message)
      false
    end
  end
  
end