module Accounts
  class OnClose
    include CommandHandler

    def call(cmd)
      with_aggregate(Account, cmd.aggregate_id) do |account|
        account.close
      end
    end
  end
end
