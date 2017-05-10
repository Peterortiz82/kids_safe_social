# frozen_string_literal: true

class AddBlackListedWordsListToConnectionAccount < ActiveRecord::Migration[5.0]

  def change
    add_column :connection_accounts, :blacklisted_words_list, :jsonb, default: []
  end

end
