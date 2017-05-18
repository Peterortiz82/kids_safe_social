# frozen_string_literal: true

class Organization::AccountsController < ApplicationController

  before_action :set_account, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!

  def index
    @accounts = current_user.organization.accounts
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new
    @account.organization = current_user.organization
    @account.update!(account_params)

    if @account.save!
      redirect_to accounts_path
    else
      render :new
    end
  end

  def update
    if @account.update!(account_params)
      redirect_to accounts_path
    else
      rener :edit
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @account.destroy!
    redirect_to accounts_path
  end
  
private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:name)
  end

end