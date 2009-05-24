module StaticHelper
  
  def phones(plan)
    if (plan.phones == 0)
      "Unlimited phones"
    else
      "#{plan.phones} phones"
    end
  end
  
  def monthly_price(plan)
    "$#{plan.amount}/month"
  end
  
end
