class FlaggedPost < Post

  def send_notifications
    user = connection_account.account.organization.user

    PostMailer.flagged_twitter_post(user, self).deliver_later
    SendSmsWorker.perform_async(user.id, id) if user.phone_number.present? && user.sms_enabled?
  end

end