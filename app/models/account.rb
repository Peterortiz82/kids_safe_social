# frozen_string_literal: true

class Account < ApplicationRecord

  belongs_to :organization
  has_many :connection_accountsm, dependent: :destroy

  validates :name, presence: true
  validates :organization_id, presence: true

end
