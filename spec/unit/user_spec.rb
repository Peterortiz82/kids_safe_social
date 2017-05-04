# frozen_string_literal: true
require 'rails_helper'

describe User, type: :model do

  subject { create :user }

  it { should validate_presence_of :name }

  it { should validate_length_of :name }

  it 'should create an Organization' do
    expect{ subject }.to change{ Organization.count }.from(0).to(1)
  end

  context 'Phone Number' do
    it 'should only contain numbers' do
      subject.phone_number = '555xyz5555'

      expect(subject).not_to be_valid
    end

    it 'should not be more than 11 numbers' do
      subject.phone_number = '123456789012'

      expect(subject).not_to be_valid
    end

    it 'should not be less than 10 numbers' do
      subject.phone_number = '1234564'

      expect(subject).not_to be_valid
    end

    it 'should not be required' do
      subject.phone_number = ''

      expect(subject).to be_valid
    end
  end

end
