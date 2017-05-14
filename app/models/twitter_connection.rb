# frozen_string_literal: true

class TwitterConnection < ConnectionAccount

  def has_valid_connection?
    twitter_user.present?
  end

  def update_connection!
    update!(
      id_str: twitter_user.id.to_s,
      latest_post_id: twitter_user.status.id.to_s,
      name: twitter_user.name,
      followers_count: twitter_user.followers_count,
      description: twitter_user.description,
      avatar_url: twitter_user.profile_image_url.to_s.gsub('_normal', ''),
      blacklisted_words_list: blacklisted_words_array
    )
  end

  def post_data(number_of_posts)
    return if get_posts(number_of_posts).nil?
    posts_array = []

    get_posts(number_of_posts).each do |post|
      posts_array << {
        created_at: post.created_at,
        id_str: post.id.to_s,
        screen_name: post.user.screen_name,
        post_text: post.text.downcase.gsub(/[^a-z0-9\s]/i, '')
      }
    end

    posts_array
  end

private

  def get_posts(number_of_posts)
    @posts ||= TWITTER_CLIENT.user_timeline(handle).take(number_of_posts)
  end

  def twitter_user
    @twitter_user ||= TWITTER_CLIENT.user(handle)
  end

end