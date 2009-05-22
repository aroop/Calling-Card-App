class CreateCdrs < ActiveRecord::Migration
  def self.up
    create_table :cdrs do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :cdrs
  end
end
