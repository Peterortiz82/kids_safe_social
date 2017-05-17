# frozen_string_literal: true

class TwitterConnection < ConnectionAccount

  def self.find_or_create_connection(auth_hash, account_id)
    connection = where(id_str: auth_hash.extra.raw_info.id_str).first_or_create
    connection.update!(
      account_id: account_id,
      id_str: auth_hash.extra.raw_info.id_str,
      name: auth_hash.info.name,
      handle: auth_hash.info.nickname,
      avatar_url: auth_hash.extra.raw_info.profile_image_url.gsub('_normal', ''),
      followers_count: auth_hash.extra.raw_info.followers_count,
      description: auth_hash.info.description,
      access_token: auth_hash.credentials.token,
      access_token_secret: auth_hash.credentials.secret
    )
  end

  def post_data(number_of_posts)
    return if get_posts(number_of_posts).nil?
    posts_array = []

    get_posts(number_of_posts).each do |post|
      posts_array << {
        platform_type: type.chomp("Connection"),
        created_at: post.created_at,
        id_str: post.id.to_s,
        screen_name: post.user.screen_name,
        post_text: post.text.downcase.gsub(/[^a-z0-9\s]/i, ''),
        connection_account_id: id
      }
    end
    posts_array
  end

private

  def get_posts(number_of_posts)
    @posts ||= twitter_client.user_timeline.take(number_of_posts)
  end

  def twitter_client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['twitter_consumer_key']
      config.consumer_secret = ENV['twitter_consumer_secret']
      config.access_token = access_token
      config.access_token_secret = access_token_secret
    end
  end

end