class CreateSpeeddialNumbers < ActiveRecord::Migration
  def self.up
    create_table :speeddial_numbers do |t|
			t.string :number
			t.string :description
			t.integer :entry
			t.references :user
			t.timestamps
    end
  end

  def self.down
    drop_table :speeddial_numbers
  end
end
