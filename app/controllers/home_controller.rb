# frozen_string_literal: true

class HomeController < ApplicationController

  def index
    if current_user.present?
      redirect_to  organization_accounts_path
    end
  end

end
