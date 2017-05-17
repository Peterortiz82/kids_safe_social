# frozen_string_literal: true

class AddSmsEnanabledToUser < ActiveRecord::Migration[5.0]

  def change
    add_column :users, :sms_enabled, :boolean, default: false
  end

end
