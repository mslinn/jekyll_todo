require 'spec_helper'
require_relative '../lib/jekyll_todo'

RSpec.describe JekyllTodoModule do
  extend described_class # Define class methods from JekyllTodoModule

  let(:logger) do
    PluginMetaLogger.instance.new_logger(self, PluginMetaLogger.instance.config)
  end

  let(:parse_context) { TestParseContext.new } # Mock, may not be desired

  it 'has a test' do
    expect(true).to be_true
  end
end
