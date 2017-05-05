# frozen_string_literal: true
require 'rails_helper'

describe Account, type: :model do

  subject { create :account }

  it { should validate_presence_of :name }

  it { should validate_presence_of :organization_id }

end

