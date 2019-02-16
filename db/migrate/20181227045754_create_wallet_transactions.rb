class CreateAccountTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :account_transactions do |t|
      t.string :account_uid
      t.column :transaction_type, :integer, default: 0
      t.string :description
      t.integer :amount_deposited
      t.integer :amount_withdrawn

      t.timestamps null: false
    end
  end
end
