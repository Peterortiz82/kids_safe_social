# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :organization, dependent: :destroy

  validates :name, presence: true, length: { in: 1..100 }
  validates :phone_number, length: { in: 10..14 }, allow_blank: true

  after_create :create_organization_for_user

  def clean_phone_number
    phone = phone_number.scan(/\d+/).join
    phone[0] == "1" ? phone[0] = "" : phone
    phone unless phone.length != 10
  end

private

  def create_organization_for_user
    CreateOrganization.new(self).call
  end

end
