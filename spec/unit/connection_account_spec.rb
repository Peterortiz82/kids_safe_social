# frozen_string_literal: true
require 'rails_helper'

describe ConnectionAccount, type: :model do

  subject { create :connection_account }

  it { should validate_presence_of :id_str }

end