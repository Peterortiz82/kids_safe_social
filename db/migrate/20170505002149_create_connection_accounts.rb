# frozen_string_literal: true

class CreateConnectionAccounts < ActiveRecord::Migration[5.0]

  def change
    create_table :connection_accounts do |t|
      t.references :account, foreign_key: true
      t.string :type
      t.string :id_str
      t.text :access_token
      t.text :access_token_secret
      t.datetime :disconnected_at

      t.timestamps
    end
  end

end
