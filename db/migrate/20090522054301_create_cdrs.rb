class CreateCdrs < ActiveRecord::Migration
  def self.up
    create_table :cdrs do |t|
      t.datetime :calldate
      t.string :src
      t.string :dst
      t.string :channel
      t.string :dstchannel
      t.string :didnumber
      t.integer :duration
      t.integer :billsec
      t.string  :disposition
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :cdrs
  end
end