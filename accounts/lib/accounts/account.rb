require 'aggregate_root'

module Accounts
  class Account
    include AggregateRoot

    AlreadyExist = Class.new(StandardError)
    NoAccount = Class.new(StandardError)
    InvalidAmount = Class.new(StandardError)
    NotEnoughMoney = Class.new(StandardError)

    def initialize(id)
      @id = id
      @amount = 0
      @state = nil
    end

    attr_accessor :state

    def open
      raise AlreadyExist unless not_opened?
      apply Opened.new(data: {account_id: @id, amount: @amount})
    end

    def close
      raise AlreadyExist unless not_opened?
      apply Closed.new(data: {account_id: @id})
    end

    def deposit(amount, description)
      raise NoAccount if not_opened?
      raise InvalidAmount if amount < 0

      apply Deposit.new(
        data: {
          account_id: @id,
          amount: amount,
          description: description
        }
      )
    end

    def withdraw(amount, description)
      raise NoAccount if not_opened?
      raise NotEnoughMoney if not_enough_money?(amount)

      apply Withdraw.new(
        data: {
          account_id: @id,
          amount: amount,
          description: description
        }
      )
    end

    on Opened do |event|
      self.state = :opened
    end

    on Closed do |event|
      self.state = :closed
    end

    on Deposit do |event|
      self.amount += event.data[:amount]
    end

    on Withdraw do |event|
      self.amount -= event.data[:amount]
    end

    private

    def not_opened?
      @state != :opened
    end

    def not_enough_money?
      @amount < amount
    end
  end
end
