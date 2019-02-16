module Accounts
  class OpenAccount < Command
    attribute :account_id, Types::UUID

    alias :aggregate_id :account_id
  end
end
