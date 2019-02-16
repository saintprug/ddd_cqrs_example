module Accounts
  class OnOpen
    include CommandHandler

    def call(cmd)
      with_aggregate(Account, cmd.aggregate_id) do |account|
        account.open
      end
    end
  end
end
