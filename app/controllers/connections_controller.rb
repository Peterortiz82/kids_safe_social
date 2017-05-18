# frozen_string_literal: true

class ConnectionsController < ApplicationController

  def create
    connection = "#{params[:provider].capitalize}Connection".constantize
    connection.find_or_create_connection(auth_hash, params[:account_id])
    redirect_to account_path(params[:account_id])
  end

private

  def auth_hash
    request.env['omniauth.auth']
  end

end