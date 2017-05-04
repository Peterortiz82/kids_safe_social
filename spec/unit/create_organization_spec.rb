# frozen_string_literal: true
require 'rails_helper'

describe CreateOrganization do

  it 'should assign the users name + Organization as the Organizations name' do
    user = create(:user)
    org = CreateOrganization.new(user).call

    expect(org.name).to eq("#{user.name} Organization")
  end

end
