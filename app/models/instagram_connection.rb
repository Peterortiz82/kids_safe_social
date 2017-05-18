# frozen_string_literal: true

class InstagramConnection < ConnectionAccount


  def self.find_or_create_connection(auth_hash, account_id)
    connection = where(id_str: auth_hash.extra.raw_info.id).first_or_create
    connection.update!(
      account_id: account_id,
      id_str: auth_hash.extra.raw_info.id,
      name: auth_hash.info.name,
      handle: auth_hash.info.nickname,
      avatar_url: auth_hash.extra.raw_info.profile_picture,
      description: auth_hash.info.bio,
      access_token: auth_hash.credentials.token,
    )
  end

private

  def instagram_client
    Instagram.configure do |config|
      config.client_id = ENV['INSTAGRAM_ID']
      config.client_secret = ENV['INSTAGRAM_SECRET']
    end
  end

end