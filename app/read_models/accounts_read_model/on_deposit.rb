module AccountsReadModel
  class OnDeposit
    def call(event)
      account = Account.find_by(uid: event.data[:account_id])
      return unless account

      account.balance += event.data[:amount]
      account.save!

      AccountTransaction.create!(
        account_uid: account.uid,
        transaction_type: :deposit,
        description: event.data[:description],
        amount_deposited: event.data[:amount],
        balance: account.balance
      )
    end
  end
end
