# frozen_string_literal: true

FactoryGirl.define do

  factory :organizations do
    name 'Test Organization'

    association :user
  end

end
