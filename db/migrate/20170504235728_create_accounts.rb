# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[5.0]

  def change
    create_table :accounts do |t|
      t.string :name
      t.references :organizations, foreign_key: true

      t.timestamps
    end
  end

end
