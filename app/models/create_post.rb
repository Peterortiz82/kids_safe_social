# frozen_string_literal: true

class CreatePost

  attr_reader :post, :blacklisted_words, :post_type, :connection

  def initialize(post, connection, post_type, blacklisted_words = [])
    @post = post
    @connection = connection
    @post_type = post_type
    @blacklisted_words = blacklisted_words
  end

  def call
    post_type.constantize.create!(
      id_str: post[:id_str],
      post_type: post[:platform_type],
      connection_account_id: connection.id,
      blacklisted_words: blacklisted_words,
      screen_name: post[:screen_name],
      post_text: post[:post_text],
      post_created_at_date: post[:created_at]
    )
  end

end