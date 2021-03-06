# frozen_string_literal: true

class Post < ApplicationRecord

  belongs_to :connection_account

  validates :id_str, :connection_account_id, presence: true
  validates :id_str, uniqueness: true

  after_create_commit :send_notifications

end
