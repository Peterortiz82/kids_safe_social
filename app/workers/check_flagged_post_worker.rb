# frozen_string_literal: true

class CheckFlaggedPostWorker

  include Sidekiq::Worker

  sidekiq_options queue: :filter_posts

  def perform(connection_id)
    connection = ConnectionAccount.find(connection_id)

    FilterPost.new(connection).check_post
  end

end