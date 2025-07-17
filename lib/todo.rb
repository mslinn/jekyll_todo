require 'jekyll_plugin_support'
require 'helper/jekyll_plugin_helper'
require_relative 'jekyll_todo/version'

# See https://www.mslinn.com/jekyll/10200-jekyll-plugin-background.html
# See https://www.mslinn.com/jekyll/10400-jekyll-plugin-template-collection.html
#
# @example Heading for this example
#   Describe what this example does
#   {% my_block_tag param1="value1" %}
#     Hello, world!
#   {% endmy_block_tag %}
#
# The Jekyll log level defaults to :info, which means all the Jekyll.logger statements below will not generate output.
# You can control the log level when you start Jekyll.
# To set the log level to :debug, write an entery into _config.yml, like this:
# plugin_loggers:
#   Todo: debug

module JekyllTodo
  # This class implements the Jekyll  functionality
  class Todo < JekyllSupport::JekyllBlock
    # Defines class methods, see https://mslinn.com/jekyll/10700-designing-for-testability.html:
    extend TodoModule

    PLUGIN_NAME = 'todo'.freeze
    VERSION = JekyllTodo::VERSION

    # See https://github.com/mslinn/jekyll_plugin_support#argument-parsing
    #
    # The following variables are predefined:
    #   @argument_string, @config, @envs, @helper, @layout, @logger, @mode, @page, @paginator, @site and @theme
    #   @tag_name [String] is the name of the tag, which we already know.
    #   @argument_string [String] the arguments from the web page.
    #   @tokens [Liquid::ParseContext] tokenized command line
    #
    # @helper provides these read-only attributes:
    #   argv, attribution, keys_values, liquid_context, logger, markup, no_arg_parsing, params, tag_name,
    #   argv_original, excerpt_caller, keys_values_original, params_original
    # @helper provides these class methods:
    #   expand_env, register, remove_quotes
    # @helper provides these instance methods:
    #   attribution_string
    #   default_attribution
    #   delete_parameter
    #   dereference_include_variable
    #   dereference_variable
    #   lookup_variable
    #   parameter_specified?('option/keyword name') || 'default value' # parse option value/keyword
    #   gem_file __FILE__ # Enables attribution
    #   remaining_markup # unparsed markup passed to this plugin
    #   reinitialize # Returns markup remaining after `parameter_specified?` has been invoked.
    #   remaining_markup_original
    #
    # @return [string] markup to be rendered on web page
    def render_impl(content)
      

      # Put your plugin logic here and modify the following return value.

      <<~HEREDOC
        <pre class="example">
          content = '#{content}'
          
          Remaining markup: '#{@helper.remaining_markup}'.
        </pre>
      HEREDOC
    rescue StandardError => e
      @logger.error { "#{self.class} died with a #{e.full_message}" }
      exit 3
    end

    ::JekyllSupport::JekyllPluginHelper.register(self, PLUGIN_NAME)
  end
end
