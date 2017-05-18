# frozen_string_literal: true

class SendSmsWorker

  include Sidekiq::Worker

  sidekiq_options queue: :notifications

  def perform(user_id, post_id)
    user = User.find(user_id)
    post = Post.find(post_id)

    Messenger.new(user.clean_phone_number, text_body(post)).send_sms if user.phone_number.present?
  end

  def text_body(post)
    if post.post_type == "Twitter"
      "A #{post.post_type} Post has been flagged for #{post.connection_account.name}. \nhttps://twitter.com/#{post.screen_name}/status/#{post.id_str}"
    end
  end

end