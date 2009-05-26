namespace :db do
  desc 'Load an initial set of data'
  task :bootstrap => :environment do
    puts 'Creating tables...'
    Rake::Task["db:migrate"].invoke
    
    puts 'Loading data...'
    if Plan.count == 0
      plans = [
        { 'name' => 'Basic', 'minutes' => 500, 'phones' => 2, 'price' => 2.39, 'description' => 'For individual' },
        { 'name' => 'Plus', 'minutes' => 1000, 'phones' => 5, 'price' => 1.95, 'description' => 'Most popular plan' },
        { 'name' => 'Premium', 'minutes' => 1500, 'phones' => 0, 'price' => 1.59, 'description' => 'For Big families' },
        { 'name' => 'Max', 'minutes' => 2000, 'phones' => 0, 'price' => 1.49, 'description' => 'Top of the line' }
      ].collect do |plan|
        Plan.create(plan)
      end
    end
    
    # cc = ActiveMerchant::Billing::CreditCard.new
    # cc.number = 4012888888881881
    # cc.month = 5
    # cc.year = 2012
    # cc.verification_value = '012'
    # cc.type = 'visa'
    # cc.first_name = 'Ajay kumar'
    # cc.last_name = 'Guthikonda'

    # user = User.create(:creditcard => cc)
    # user.login = 'aroop'
    # user.first_name = 'Ajay kumar'
    # user.last_name = 'Guthikonda'
    # user.email = 'aroopchandra@gmail.com'
    # user.password = 'ajatha'
    # user.password_confirmation = 'ajatha'
    # user.plan = Plan.find(:first)
    # user.save!
    
    puts "All done!\n\n"
  end
end