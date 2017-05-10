# frozen_string_literal: true

class Organization::ConnectionAccountsController < ApplicationController

  before_action :authenticate_user!

  def new
    @connection = ConnectionAccount.new
  end

  def create
    @connection = params[:connection_type].constantize.new
    @connection.account_id = params[:account_id]
    @connection.update!(connection_params)
    @connection.update_connection!

    if @connection.save!
      redirect_to organization_account_path(params[:account_id])
    else
      render :new
    end
  end

private

  def set_connection_account
    @connection = ConnectionAccount.find(params[:id])
  end

  def connection_params
    params.require(:connection_account).permit(:handle)
  end

end