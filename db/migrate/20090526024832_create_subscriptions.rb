class CreateSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :subscriptions do |t|
      t.datetime    :next_renewal_at
      t.references  :user
      t.references  :plan
      t.string      :state,           :default => 'pending'
      t.integer     :renewal_period,  :default => 1
      t.timestamps
    end
  end

  def self.down
    drop_table :subscriptions
  end
end