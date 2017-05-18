# frozen_string_literal: true

class RemoveBlacklistedWordsListFromConnectionAndAddToAccount < ActiveRecord::Migration[5.0]

  def change
    remove_column :connection_accounts, :blacklisted_words_list, :jsonb
    add_column :accounts, :blacklisted_words_list, :text
  end

end
