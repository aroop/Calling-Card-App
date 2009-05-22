class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      #Required fields of authlogic
      t.string :login,                    :null => false
      t.string :email,                    :null => false
      t.string :crypted_password,         :null => false
      t.string :password_salt,            :null => false
      t.string :single_access_token,      :null => false
      t.string :persistence_token,        :null => false
      t.string :perishable_token,         :null => false, :default => ""
      
      #Magic Fields of Authlogic
      t.integer   :login_count,         :null => false, :default => 0
      t.integer   :failed_login_count,  :null => false, :default => 0
      t.datetime  :last_request_at                                   
      t.datetime  :current_login_at                                  
      t.datetime  :last_login_at                                     
      t.string    :current_login_ip                                  
      t.string    :last_login_ip

      #Application Specific Information
      t.string :first_name,               :null => false
      t.string :last_name,                :null => false
      t.string :address_1,                :null => false
      t.string :address_2,                :null => false
      t.string :city,                     :null => false
      t.string :state,                    :null => false
      t.string :zip_code,                 :null => false
      t.string :phone_number,             :null => false

      t.timestamps
    end
  end
  
  def self.down
    drop_table :users
  end
end
