class CreateCommissions < ActiveRecord::Migration[4.2]
  def self.up
    create_table :commissions do |t|
      t.string :name
      t.text :description
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :commissions
  end
end
