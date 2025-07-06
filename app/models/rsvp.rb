class Rsvp < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  after_create :enqueue_airtable_sync

  def self.find_or_create_by_email!(email)
    find_or_create_by!(email: email.downcase.strip)
  end

  def self.invite_to_slack(email)
    channels = [
      "C75M7C0SY", # #welcome
      "C039PAG1AV7", # #slack-welcome-start
      "C08Q1H6D79B", # #highway
      "C08PJ6G88QN", # #highway-announcements
      "C08S22XRYMU" # #highway-pitstop
    ].join(",")

    uri = URI("https://slack.com/api/users.admin.inviteBulk")
    headers = {
      "Cookie" => "d=#{ENV.fetch('SLACK_COOKIE')}",
      "Content-Type" => "application/json",
      "Authorization" => "Bearer #{ENV.fetch('SLACK_BROWSER_TOKEN')}"
    }
    data = {
      token: ENV.fetch("SLACK_BROWSER_TOKEN"),
      invites: [
        {
          email: email,
          type: "restricted",
          mode: "manual"
        }
      ],
      restricted: true,
      channels: channels
    }
    http = Net::HTTP.new(uri.hostname, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri, headers)
    request.body = data.to_json
    response = http.request(request)
    j = JSON.parse(response.body)
    raise "Slack API general error: #{j['error']}" unless j["ok"]
    raise "Slack API error: successful but no invites" if !j["invites"] || j["invites"].empty?
    raise "Slack API error on invite: #{j["invites"][0]["error"]}" unless j["invites"][0]["ok"]
    { ok: true }
  end

  def sync_with_airtable!
    uri = URI("https://api.airtable.com/v0/appuDQSHCdCHyOrxw/tblhGTc3WX9nYzU18")

    request = Net::HTTP::Patch.new(uri)
    request["Authorization"] = "Bearer #{ENV.fetch("AIRTABLE_API_KEY")}"
    request["Content-Type"] = "application/json"
    request.body = {
      performUpsert: {
        fieldsToMergeOn: [ "email" ]
      },
      records: [
        {
          fields: {
            email: email,
            url_params: url_params
          }
        }
      ]
    }.to_json

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end

    puts response.body

    self.airtable_record_id = JSON.parse(response.body).dig("records", 0, "id")
    save!
  end

  private

  def enqueue_airtable_sync
    SyncRsvpWithAirtableJob.perform_later(id)
  end
end
