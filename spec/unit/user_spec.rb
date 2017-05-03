# frozen_string_literal: true
require 'rails_helper'

describe User, type: :model do

  subject { create :user }

  it { should validate_presence_of :name }

  it { should validate_length_of :name }

end
