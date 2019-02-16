module Accounts
  class Deposit < Command
    attribute :account_id, Types::UUID
    attribute :amount, Types::Coercible::Integer
    attribute :description, Types::Strict::String.optional

    alias :aggregate_id :account_id
  end
end
