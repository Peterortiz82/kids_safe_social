# frozen_string_literal: true

class Organization::Accounts::ConnectionAccountsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_connection_account, only: [:show, :destroy]

  def new
    @connection = ConnectionAccount.new
  end

  def show; end

  def destroy
    @connection.destroy!
    redirect_to account_path(params[:account_id])
  end

private

  def set_connection_account
    @connection = ConnectionAccount.find(params[:id])
  end

end