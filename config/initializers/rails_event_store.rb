require 'rails_event_store'
require 'aggregate_root'
require 'arkency/command_bus'


Rails.configuration.to_prepare do
  Rails.configuration.event_store = RailsEventStore::Client.new
  Rails.configuration.command_bus = Arkency::CommandBus.new

  # Note: Commands are Present Tense
  Rails.configuration.command_bus.tap do |bus|
    bus.register(Accounts::Open, Accounts::OnOpen.new)
    bus.register(Accounts::Close, Accounts::OnClose.new)
    bus.register(Accounts::Deposit, Accounts::OnDeposit.new)
    bus.register(Accounts::Withdraw, Accounts::OnWithdraw.new)
  end

  AggregateRoot.configure do |config|
    config.default_event_store = Rails.configuration.event_store
  end

  Rails.configuration.event_store.tap do |store|
    # Accounts (Subscriptions)
    store.subscribe(AccountsReadModel::OnOpen, to: [Accounts::Open])
    store.subscribe(AccountsReadModel::OnClose, to: [Accounts::Close])
    store.subscribe(AccountsReadModel::OnDeposit, to: [Accounts::Deposit])
    store.subscribe(AccountsReadModel::OnWithdraw, to: [Accounts::Withdraw])
  end
end
