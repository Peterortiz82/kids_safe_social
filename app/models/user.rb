# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :organization, dependent: :destroy

  validates :name, presence: true, length: { in: 1..100 }
  validates :phone_number, numericality: true, length: { in: 10..11 }, allow_blank: true

  after_create :create_organization_for_user

private

  def create_organization_for_user
    CreateOrganization.new(self).call
  end

end
