class AccountsController < ApplicationController
  def index
    @accounts = AccountsReadModel::Account.all
  end

  def show
    @account = AccountsReadModel::Account.find_by(uid: params[:id])
  end

  def new
  end

  def create
    account_id  = SecureRandom.uuid
    cmd = Accounts::Open.new(account_id: account_id)
    command_bus.call(cmd)

    redirect_to accounts_path(cmd.account_id)
  end

  def close
    cmd = Accounts::Close.new(account_id: account_id)
    command_bus.call(cmd)

    redirect_to accounts_path(cmd.account_id)
  end

  def deposit
    cmd = Accounts::Deposit.new(
      account_id: params[:id],
      amount: params[:amount],
      description: params[:description])

    command_bus.call(cmd)
    redirect_to account_path(params[:id])
  end

  def withdraw
    cmd = Accounts::Withdraw.new(
      account_id: params[:id],
      amount: params[:amount],
      description: params[:description])

    command_bus.call(cmd)
    redirect_to account_path(params[:id])
  end

  def history
    @event_history = AccountsReadModel::AccountTransaction.where(account_uid: params[:id]).order(created_at: :desc)
  end
end
