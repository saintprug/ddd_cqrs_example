class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :uid
      t.integer :balance
      t.string :state
    end
  end
end
