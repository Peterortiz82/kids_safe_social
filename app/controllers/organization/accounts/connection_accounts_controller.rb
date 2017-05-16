# frozen_string_literal: true

class Organization::Accounts::ConnectionAccountsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_connection_account, only: [:show]

  def new
    @connection = ConnectionAccount.new
  end

  def create
    connection = "#{params[:provider].capitalize}Connection".constantize
    connection.find_or_create_connection(auth_hash, params[:account_id])
    redirect_to organization_account_path(params[:account_id])
  end

  def show; end

private

  def auth_hash
    request.env['omniauth.auth']
  end

  def set_connection_account
    @connection = ConnectionAccount.find(params[:id])
  end

  def connection_params
    params.require(:connection_account).permit(:blacklisted_words_list)
  end

end