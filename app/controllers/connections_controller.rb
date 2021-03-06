# frozen_string_literal: true

class ConnectionsController < ApplicationController

  def create
    account_id = request.env['omniauth.params']['account_id'].to_i
    connection = "#{params[:provider].capitalize}Connection".constantize
    connection.find_or_create_connection(auth_hash, account_id)
    redirect_to account_path(account_id)
  end

private

  def auth_hash
    request.env['omniauth.auth']
  end

end