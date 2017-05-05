# frozen_string_literal: true

FactoryGirl.define do
  factory :account do
    name 'Test Account'
    association :organization
  end
end
