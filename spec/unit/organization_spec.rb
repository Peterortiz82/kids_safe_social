# frozen_string_literal: true
require 'rails_helper'

describe Organization, type: :model do

  subject { create :organizations }

  it { should validate_presence_of :name }

  it { should validate_presence_of :user_id }

end
