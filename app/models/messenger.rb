# frozen_string_literal: true

class Messenger

  def initialize(phone, body)
    @phone = phone
    @body = body
  end

  def send_sms
    acct_sid = ENV["twilio_sid"]
    auth_token = ENV["twilio_auth_token"]

    @client = Twilio::REST::Client.new(acct_sid, auth_token)

    @client.account.messages.create(
      from: "13212503159",
      to: @phone,
      body: @body
    )
  end

end