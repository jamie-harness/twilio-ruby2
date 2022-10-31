##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Oauth' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.oauth.v1.oauth().fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://oauth.twilio.com/v1/certs',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "keys": [
              {
                  "alg": "ES256",
                  "kid": "IC10c8172f35dd36f20d9ed2fcc0b818c7",
                  "key_ops": [],
                  "use": "sig",
                  "crv": "P-256",
                  "x": "hrJ4NKauVYBiREgIY_EPPj10zHIiOHeIf3-LGODt_KM",
                  "y": "c3IcyhpvfMIMpqd_ku9Q_4n20nMlelUF-zSmRXEIFEU",
                  "kty": "EC"
              }
          ],
          "url": "https://oauth.twilio.com/v1/certs"
      }
      ]
    ))

    actual = @client.oauth.v1.oauth().fetch()

    expect(actual).to_not eq(nil)
  end
end