# frozen_string_literal: true

class ConnectionAccount < ApplicationRecord

  belongs_to :account
  has_many :flagged_posts, dependent: :destroy

  validates :account_id, presence: true
  validates :id_str, uniqueness: true

  def create_flagged_post!(post, blacklisted_words)
    FlaggedPost.create!(
      id_str: post[:id_str],
      post_type: type.gsub("Connection", "Post"),
      connection_account_id: id,
      blacklisted_words: blacklisted_words,
      screen_name: post[:screen_name],
      post_text: post[:post_text],
      post_created_at_date: post[:created_at]
    )
  end

  def name(type)
    type.chomp("Connection")
  end


private

  def blacklisted_words_array
    return [] unless blacklisted_words_list.present?

    blacklisted_words_list.gsub(" ", "").split(",")
  end

end
