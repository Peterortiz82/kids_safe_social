# frozen_string_literal: true

FactoryGirl.define do

  factory :connection_account do
    sequence(:id_str) { |n| "account#{n}" }
    access_token { SecureRandom.hex }
    access_token_secret { SecureRandom.hex }

    association :account
  end

end
