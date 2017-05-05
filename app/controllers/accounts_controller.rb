# frozen_string_literal: true

class AccountsController < ApplicationController

  before_action :authenticate_user!

  def new
    @account = Account.new
  end

  def create
    @account = Account.new
    @account.update(account_params)
    @account.organization = current_user.organization

    if @account.save!
      redirect_to organization_path
    else
      render :new
    end
  end

  def update

  end

  def edit

  end

  def destroy

  end
  
private

  def account_params
    params.require(:account).permit(:name)
  end

end