# frozen_string_literal: true

require_relative 'drive_v3/version'
require_relative 'drive_v3/create_credential'

require 'google/apis/drive_v3'
require 'json'
require 'logger'

# Unofficial helpers for the Google Drive V3 API
#
# @api public
#
module DriveV3
  class << self
    # Create a new Google::Apis::DriveV3::DriveService object
    #
    # Simplifies creating and configuring a the credential.
    #
    # @example using the credential in `~/.google-api-credential`
    #   DriveV3.drive_service
    #
    # @example using a credential passed in as a string
    #   credential_source = File.read(File.expand_path('~/.google-api-credential.json'))
    #   DriveV3.drive_service(credential_source:)
    #
    # @example using a credential passed in as an IO
    #   credential_source = File.open(File.expand_path('~/.google-api-credential.json'))
    #   DriveV3.drive_service(credential_source:)
    #
    # @param credential_source [nil, String, IO, Google::Auth::*] may
    #   be either an already constructed credential, the credential read into a String or
    #   an open file with the credential ready to be read. Passing `nil` will result
    #   in the credential being read from `~/.google-api-credential.json`.
    #
    # @param scopes [Object, Array] one or more scopes to access.
    #
    # @param credential_creator [#credential] Used to inject the credential creator for
    #   testing.
    #
    # @return a new DriveService instance
    #
    def drive_service(credential_source: nil, scopes: nil, credential_creator: DriveV3::CreateCredential)
      credential_source ||= File.read(File.expand_path('~/.google-api-credential.json'))
      scopes ||= [Google::Apis::DriveV3::AUTH_DRIVE]

      Google::Apis::DriveV3::DriveService.new.tap do |service|
        service.authorization = credential_creator.call(credential_source, scopes)
      end
    end
  end
end
