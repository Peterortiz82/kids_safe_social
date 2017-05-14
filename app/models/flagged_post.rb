class FlaggedPost < Post

  def notify_parents_of_flagged_post
    user = connection_account.account.organization.user

    FlaggedPostMailer.flagged_twitter_post(user, self).deliver_later
  end

end