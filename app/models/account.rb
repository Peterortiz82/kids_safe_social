# frozen_string_literal: true

class Account < ApplicationRecord

  belongs_to :organization
  has_many :connection_accounts, dependent: :destroy
  has_many :twitter_connections, class_name: TwitterConnection.name

  validates :name, presence: true
  validates :organization_id, presence: true

  def blacklisted_words_array
    return [] unless blacklisted_words_list.present?

    blacklisted_words_list.downcase.gsub(" ", "").split(",")
  end

end
