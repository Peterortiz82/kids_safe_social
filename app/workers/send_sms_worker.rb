# frozen_string_literal: true

class SendSmsWorker

  include Sidekiq::Worker

  def perform(user_id, post_id)
    user = User.find(user_id)
    post = Post.find(post_id)
    body = "A #{post.post_type.titleize} has been flagged. see the post here 'https://twitter.com/#{post.screen_name}/status/#{post.id_str}'"

    Messenger.new(user.clean_phone_number, body).send_sms
  end

end