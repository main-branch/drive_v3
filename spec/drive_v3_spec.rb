# frozen_string_literal: true

require 'logger'
require 'net/http'

RSpec.describe DriveV3 do
  it 'has a version number' do
    expect(DriveV3::VERSION).not_to be nil
  end

  describe '.drive_service' do
    subject { described_class.drive_service(credential_source:, scopes:, credential_creator:) }
    let(:credential_source) { double('credential_source') }
    let(:scopes) { double('scopes') }
    let(:credential_creator) { double('credential_creator') }
    let(:credential) { double('credential') }
    let(:expected_result) { double('expected_result') }

    before do
      allow(Google::Apis::DriveV3::DriveService).to receive(:new).and_return(expected_result)

      expect(expected_result).to receive(:authorization=).with(credential)

      allow(credential_creator).to(
        receive(:call)
        .with(credential_source, scopes)
        .and_return(credential)
      )
    end

    it 'should create a new Google::Apis::DriveV3::DriveService' do
      expect(subject).to eq(expected_result)
    end

    context 'when credential_source is nil' do
      let(:credential_source) { nil }
      it 'should read the credential from ~/.google-api-credential.json' do
        expect(File).to receive(:read).with(File.expand_path('~/.google-api-credential.json'))
        expect(subject).to eq(expected_result)
      end
    end

    context 'when scopes is nil' do
      let(:scopes) { nil }
      let(:expected_default_scopes) { [Google::Apis::DriveV3::AUTH_DRIVE] }

      it 'should use the default scopes' do
        expect(credential_creator).to(
          receive(:call)
          .with(credential_source, expected_default_scopes)
          .and_return(credential)
        )
        expect(subject).to eq(expected_result)
      end
    end
  end
end
