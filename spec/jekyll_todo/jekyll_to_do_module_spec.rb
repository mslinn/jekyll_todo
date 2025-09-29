require_relative '../spec_helper'
require_relative '../../lib/jekyll_todo'

RSpec.describe(JekyllToDoModule) do
  # extend described_class # Define class methods from JekyllToDoModule

  let(:logger) do
    PluginMetaLogger.instance.new_logger(self, PluginMetaLogger.instance.config)
  end

  let(:parse_context) { TestParseContext.new } # Mock, may not be desired

  it 'has a test' do
    actual = 'something'
    expect(actual).to be_truthy
  end
end
