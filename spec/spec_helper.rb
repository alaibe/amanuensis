require 'pry'
require 'dotenv'
require 'vcr'
require 'active_support/inflections'

require_relative '../lib/amanuensis'

Dotenv.load

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.around(:each) do |example|
    options = example.metadata[:vcr] || {}

    if options[:record] == :skip
      VCR.turned_off(&example)
    else
      name = example.metadata[:full_description].split(/\s+/, 2).join("/").underscore.gsub(/[^\w\/]+/, "_")
      VCR.use_cassette(name, options, &example)
    end
  end
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock

  config.filter_sensitive_data('GITHUB_OAUTH_TOKEN') { ENV.fetch('GITHUB_OAUTH_TOKEN') }
  config.filter_sensitive_data('GITHUB_REPO')        { ENV.fetch('GITHUB_REPO') }
end
