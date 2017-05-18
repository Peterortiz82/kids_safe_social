# frozen_string_literal: true

class Organization::Accounts::ConnectionAccountsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_connection_account, only: [:show]

  def new
    @connection = ConnectionAccount.new
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