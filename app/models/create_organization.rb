# frozen_string_literal: true

class CreateOrganization

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def call
    user.organization || Organization.create!(name: "#{user.name} Organization", user: user)
  end

end
