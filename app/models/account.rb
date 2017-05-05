# frozen_string_literal: true

class Account < ApplicationRecord

  belongs_to :organization

  validates :name, presence: true
  validates :organization_id, presence: true

end
