module AccountsReadModel
  class OnClose
    def call(event)
      account = Account.find_by(uid: event.data[:account_id])
      return unless account

      Account.update!(state: :closed)
    end
  end
end
