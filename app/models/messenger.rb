# frozen_string_literal: true

class Messenger

  def initialize(phone, body)
    @phone = phone
    @body = body
  end

  def send_sms
    acct_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    @client = Twilio::REST::Client.new(acct_sid, auth_token)

    @client.account.messages.create(
      from: "13212503159",
      to: @phone,
      body: @body
    )
  end

end