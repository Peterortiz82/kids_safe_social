# frozen_string_literal: true
require 'rails_helper'

describe CreateOrganization do

  setup do
    @user = create(:user)
  end

  it 'should create an Organization' do
    expect{ CreateOrganization.new(@user).call }.to change{ Organization.count }.from(0).to(1)
  end

  it 'should assign the users name + Organization as the Organizations name' do
    org = CreateOrganization.new(@user).call

    expect(org.name).to eq("#{@user.name} Organization")
  end

end
