# frozen_string_literal: true

class AddLatestPostIdToConnectionAccount < ActiveRecord::Migration[5.0]

  def change
    add_column :connection_accounts, :latest_post_id, :string
  end

end
