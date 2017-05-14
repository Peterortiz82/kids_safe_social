# frozen_string_literal: true

class CheckFlaggedPostWorker

  include Sidekiq::Worker

  def perform(connection_id)
    connection = ConnectionAccount.find(connection_id)

    FilterPost.new(connection).check_post
  end

end