# frozen_string_literal: true

FactoryGirl.define do

  factory :organization do
    name 'Test Organization'

    association :user
  end

end
