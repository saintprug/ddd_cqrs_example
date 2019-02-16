module AccountsReadModel
  class OnOpen
    def call(event)
      Account.create!(
        uid: event.data[:account_id],
        balance: event.data[:amount]
      )
    end
  end
end
