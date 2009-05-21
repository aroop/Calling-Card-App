class CreatePinlessNumbers < ActiveRecord::Migration
  def self.up
    create_table :pinless_numbers do |t|
			t.string :ani_or_phonenumber
			t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :pinless_numbers
  end
end
