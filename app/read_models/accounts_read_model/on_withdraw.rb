module AccountsReadModel
  class OnWithdraw
    def call(event)
      account = Account.find_by(uid: event.data[:account_id])
      return unless account

      account.balance -= event.data[:amount]
      account.save!

      AccountTransaction.create!(
        account_uid: account.uid,
        transaction_type: :withdraw,
        description: event.data[:description],
      )
    end
  end
end
