module AccountsReadModel
  class AccountTransaction < ApplicationRecord
    self.table_name = "account_transactions"

    enum transaction_type: { deposit: 0, withdrawal: 1 }
  end
end
