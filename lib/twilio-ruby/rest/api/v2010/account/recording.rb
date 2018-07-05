##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class RecordingList < ListResource
            ##
            # Initialize the RecordingList
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The unique ID of the
            #   [Account](https://www.twilio.com/docs/api/rest/account) responsible for this
            #   recording.
            # @return [RecordingList] RecordingList
            def initialize(version, account_sid: nil)
              super(version)

              # Path Solution
              @solution = {account_sid: account_sid}
              @uri = "/Accounts/#{@solution[:account_sid]}/Recordings.json"
            end

            ##
            # Lists RecordingInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Time] date_created_before Filter by date created
            # @param [Time] date_created Filter by date created
            # @param [Time] date_created_after Filter by date created
            # @param [String] call_sid Only show recordings made during the call given by the
            #   indicated sid
            # @param [String] conference_sid The conference_sid
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(date_created_before: :unset, date_created: :unset, date_created_after: :unset, call_sid: :unset, conference_sid: :unset, limit: nil, page_size: nil)
              self.stream(
                  date_created_before: date_created_before,
                  date_created: date_created,
                  date_created_after: date_created_after,
                  call_sid: call_sid,
                  conference_sid: conference_sid,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams RecordingInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Time] date_created_before Filter by date created
            # @param [Time] date_created Filter by date created
            # @param [Time] date_created_after Filter by date created
            # @param [String] call_sid Only show recordings made during the call given by the
            #   indicated sid
            # @param [String] conference_sid The conference_sid
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(date_created_before: :unset, date_created: :unset, date_created_after: :unset, call_sid: :unset, conference_sid: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  date_created_before: date_created_before,
                  date_created: date_created,
                  date_created_after: date_created_after,
                  call_sid: call_sid,
                  conference_sid: conference_sid,
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields RecordingInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of RecordingInstance records from the API.
            # Request is executed immediately.
            # @param [Time] date_created_before Filter by date created
            # @param [Time] date_created Filter by date created
            # @param [Time] date_created_after Filter by date created
            # @param [String] call_sid Only show recordings made during the call given by the
            #   indicated sid
            # @param [String] conference_sid The conference_sid
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of RecordingInstance
            def page(date_created_before: :unset, date_created: :unset, date_created_after: :unset, call_sid: :unset, conference_sid: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'DateCreated<' => Twilio.serialize_iso8601_datetime(date_created_before),
                  'DateCreated' => Twilio.serialize_iso8601_datetime(date_created),
                  'DateCreated>' => Twilio.serialize_iso8601_datetime(date_created_after),
                  'CallSid' => call_sid,
                  'ConferenceSid' => conference_sid,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              RecordingPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of RecordingInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of RecordingInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              RecordingPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Api.V2010.RecordingList>'
            end
          end

          class RecordingPage < Page
            ##
            # Initialize the RecordingPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [RecordingPage] RecordingPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of RecordingInstance
            # @param [Hash] payload Payload response from the API
            # @return [RecordingInstance] RecordingInstance
            def get_instance(payload)
              RecordingInstance.new(@version, payload, account_sid: @solution[:account_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Api.V2010.RecordingPage>'
            end
          end

          class RecordingContext < InstanceContext
            ##
            # Initialize the RecordingContext
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The account_sid
            # @param [String] sid The recording Sid that uniquely identifies this resource
            # @return [RecordingContext] RecordingContext
            def initialize(version, account_sid, sid)
              super(version)

              # Path Solution
              @solution = {account_sid: account_sid, sid: sid, }
              @uri = "/Accounts/#{@solution[:account_sid]}/Recordings/#{@solution[:sid]}.json"

              # Dependents
              @transcriptions = nil
              @add_on_results = nil
            end

            ##
            # Fetch a RecordingInstance
            # @return [RecordingInstance] Fetched RecordingInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              RecordingInstance.new(@version, payload, account_sid: @solution[:account_sid], sid: @solution[:sid], )
            end

            ##
            # Deletes the RecordingInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Access the transcriptions
            # @return [TranscriptionList]
            # @return [TranscriptionContext] if sid was passed.
            def transcriptions(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return TranscriptionContext.new(@version, @solution[:account_sid], @solution[:sid], sid, )
              end

              unless @transcriptions
                @transcriptions = TranscriptionList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                    recording_sid: @solution[:sid],
                )
              end

              @transcriptions
            end

            ##
            # Access the add_on_results
            # @return [AddOnResultList]
            # @return [AddOnResultContext] if sid was passed.
            def add_on_results(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return AddOnResultContext.new(@version, @solution[:account_sid], @solution[:sid], sid, )
              end

              unless @add_on_results
                @add_on_results = AddOnResultList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                    reference_sid: @solution[:sid],
                )
              end

              @add_on_results
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Api.V2010.RecordingContext #{context}>"
            end
          end

          class RecordingInstance < InstanceResource
            ##
            # Initialize the RecordingInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] account_sid The unique ID of the
            #   [Account](https://www.twilio.com/docs/api/rest/account) responsible for this
            #   recording.
            # @param [String] sid The recording Sid that uniquely identifies this resource
            # @return [RecordingInstance] RecordingInstance
            def initialize(version, payload, account_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'api_version' => payload['api_version'],
                  'call_sid' => payload['call_sid'],
                  'conference_sid' => payload['conference_sid'],
                  'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                  'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                  'start_time' => Twilio.deserialize_rfc2822(payload['start_time']),
                  'duration' => payload['duration'],
                  'sid' => payload['sid'],
                  'price' => payload['price'],
                  'price_unit' => payload['price_unit'],
                  'status' => payload['status'],
                  'channels' => payload['channels'].to_i,
                  'source' => payload['source'],
                  'error_code' => payload['error_code'] == nil ? payload['error_code'] : payload['error_code'].to_i,
                  'uri' => payload['uri'],
                  'encryption_details' => payload['encryption_details'],
                  'subresource_uris' => payload['subresource_uris'],
              }

              # Context
              @instance_context = nil
              @params = {'account_sid' => account_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [RecordingContext] RecordingContext for this RecordingInstance
            def context
              unless @instance_context
                @instance_context = RecordingContext.new(@version, @params['account_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The unique sid that identifies this account
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The version of the API in use during the recording.
            def api_version
              @properties['api_version']
            end

            ##
            # @return [String] The unique id for the call leg that corresponds to the recording.
            def call_sid
              @properties['call_sid']
            end

            ##
            # @return [String] The unique id for the conference associated with the recording, if a conference recording.
            def conference_sid
              @properties['conference_sid']
            end

            ##
            # @return [Time] The date this resource was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date this resource was last updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [Time] The start time of the recording, given in RFC 2822 format.
            def start_time
              @properties['start_time']
            end

            ##
            # @return [String] The length of the recording, in seconds.
            def duration
              @properties['duration']
            end

            ##
            # @return [String] A string that uniquely identifies this recording
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The one-time cost of creating this recording.
            def price
              @properties['price']
            end

            ##
            # @return [String] The currency used in the Price property.
            def price_unit
              @properties['price_unit']
            end

            ##
            # @return [recording.Status] The status of the recording.
            def status
              @properties['status']
            end

            ##
            # @return [String] The number of channels in the final recording file as an integer.
            def channels
              @properties['channels']
            end

            ##
            # @return [recording.Source] The way in which this recording was created.
            def source
              @properties['source']
            end

            ##
            # @return [String] More information about the recording failure, if Status is failed.
            def error_code
              @properties['error_code']
            end

            ##
            # @return [String] The URI for this resource
            def uri
              @properties['uri']
            end

            ##
            # @return [Hash] Details for how to decrypt the recording.
            def encryption_details
              @properties['encryption_details']
            end

            ##
            # @return [String] The subresource_uris
            def subresource_uris
              @properties['subresource_uris']
            end

            ##
            # Fetch a RecordingInstance
            # @return [RecordingInstance] Fetched RecordingInstance
            def fetch
              context.fetch
            end

            ##
            # Deletes the RecordingInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Access the transcriptions
            # @return [transcriptions] transcriptions
            def transcriptions
              context.transcriptions
            end

            ##
            # Access the add_on_results
            # @return [add_on_results] add_on_results
            def add_on_results
              context.add_on_results
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.RecordingInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.RecordingInstance #{values}>"
            end
          end
        end
      end
    end
  end
end