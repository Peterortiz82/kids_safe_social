# frozen_string_literal: true

class AddFieldsToConnectionAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :connection_accounts, :name, :string
    add_column :connection_accounts, :handle, :string
    add_column :connection_accounts, :followers_count, :integer
    add_column :connection_accounts, :description, :text
    add_column :connection_accounts, :avatar_url, :string
  end
end
