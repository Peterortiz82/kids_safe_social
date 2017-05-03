# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    name 'Test User'
    password "secret_password"
    password_confirmation "secret_password"
    sequence(:email){|n| "email#{n}@domain.com" }
  end
end
