# frozen_string_literal: true

class Organization::Accounts::ConnectionAccountsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_connection_account, only: [:show]

  def new
    @connection = ConnectionAccount.new
  end

  def create
    @connection = connection_class.create(connection_params)
    @connection.account_id = params[:account_id]
    @connection.update_connection!

    if @connection.save!
      redirect_to organization_account_path(params[:account_id])
    else
      render :new
    end
  end

  def show; end

private

  def connection_class
    params[:connection_type].constantize
  end

  def set_connection_account
    @connection = ConnectionAccount.find(params[:id])
  end

  def connection_params
    params.require(:connection_account).permit(:handle, :blacklisted_words_list)
  end

end