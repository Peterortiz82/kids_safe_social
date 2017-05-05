# frozen_string_literal: true

class OrganizationsController < ApplicationController

  before_action :authenticate_user!

  def index
    @accounts = current_user.organization.accounts
  end

end
