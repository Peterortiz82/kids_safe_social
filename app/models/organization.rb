# frozen_string_literal: true

class Organization < ApplicationRecord

  belongs_to :user
  has_many :accounts

  validates :name, presence: true
  validates :user_id, presence: true

end
