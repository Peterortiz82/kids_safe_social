# frozen_string_literal: true

class AddFirstNameAndLastNameToUser < ActiveRecord::Migration[5.0]

  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
  end

end
