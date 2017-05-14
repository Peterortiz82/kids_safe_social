# frozen_string_literal: true

class HomeController < ApplicationController

  def index
    puts "#################################"
    puts "#################################"
    puts current_user.present?
    puts current_user&.name
    puts current_user&.sign_in_count
    puts "#################################"
    puts "#################################"
    if current_user.present?
      redirect_to  organization_accounts_path
    end
  end

end
