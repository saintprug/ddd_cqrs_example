module Accounts
  class OnDeposit
    include CommandHandler

    def call(cmd)
      with_aggregate(Account, cmd.aggregate_id) do |account|
        account.deposit(cmd.amount, cmd.description)
      end
    end
  end
end
