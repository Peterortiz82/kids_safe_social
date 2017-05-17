# frozen_string_literal: true

class ConnectionAccount < ApplicationRecord

  belongs_to :account
  has_many :flagged_posts, dependent: :destroy

  validates :account_id, presence: true
  validates :id_str, uniqueness: true

end
