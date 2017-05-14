# frozen_string_literal: true

class FlaggedPostMailer < ActionMailer::Base

  def flagged_twitter_post(user, flagged_post)
    @user = user
    @account = flagged_post.connection_account.account
    @post = flagged_post

    mail(to: @user.email, subject: "A #{@post.post_type.titleize} has been flagged for #{@account.name}", user_name: @user.name, from: "donotreply@kidssafesocial.com")
  end

end