module Accounts
  class OnWithdraw
    include CommandHandler

    def call(cmd)
      with_aggregate(Account, cmd.aggregate_id) do |account|
        account.withdraw(cmd.amount, cmd.description)
      end
    end
  end
end
