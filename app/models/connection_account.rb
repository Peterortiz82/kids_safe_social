# frozen_string_literal: true

class ConnectionAccount < ApplicationRecord

  belongs_to :account

  validates :id_str, presence: true

end
