# frozen_string_literal: true

class FilterPost

  attr_reader :connection

  def initialize(connection)
    @connection = connection
  end

  def check_post
    return false if !posts.present? || !connection.blacklisted_words_list.present?

    posts.each do |post|
      next if Post.find_by(id_str: post[:id_str])
      blacklisted_words = []

      post[:post_text].split.each do |word|
        if connection.blacklisted_words_list.include?(word)
          blacklisted_words << word.upcase
        end
      end

      if blacklisted_words.present?
        CreatePost.new(post, connection, FlaggedPost.name, blacklisted_words).call
      end
    end
  end

private

  def posts
    connection_has_posts = Post.where(connection_account_id: connection.id).exists?
    # If this is our first time checking the connections posts, we want to grab the last
    # 20 posts. Otherwise, we will always check the last post.
    number_of_posts = connection_has_posts ? 10 : 20

    @posts ||= connection.post_data(number_of_posts)
  end

end