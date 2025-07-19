require 'jekyll_plugin_support'
require 'helper/jekyll_plugin_helper'
require_relative 'jekyll_todo/version'

# Generate a TODO block
# Options:
#   `id`
#
# @example
#   {% todo %}
#     blah blah blah
#   {% endtodo %}
#
# @example
#   {% todo id='todo1' %}
#     blah blah blah
#   {% endtodo %}
#
# The Jekyll log level defaults to :info, which means all the Jekyll.logger statements below will not generate output.
# You can control the log level when you start Jekyll.
# To set the log level to :debug, write an entery into _config.yml, like this:
# plugin_loggers:
#   Todo: debug

module JekyllToDo
  # This class implements the Jekyll  functionality
  class ToDo < JekyllSupport::JekyllBlock
    # Defines class methods, see https://mslinn.com/jekyll/10700-designing-for-testability.html:
    extend JekyllToDoModule

    PLUGIN_NAME = 'todo'.freeze
    VERSION = JekyllToDo::VERSION

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
      @alert = @helper.parameter_specified? 'alert'
      @alert_option = ' alert' if @alert

      @block = @helper.parameter_specified? 'block'
      @block_option = ' display: block;' if @block

      @class = @helper.parameter_specified? 'class'
      @class_option = " #{@class}"

      @id = @helper.parameter_specified? 'id'
      @id_option = " id='@id'" if @id

      @mode_specified = @helper.parameter_specified? 'mode'

      @span = @helper.parameter_specified? 'span' unless @block

      @style = @helper.parameter_specified? 'style'
      @style_option = " style='#{@style}#{@block_option}'" if @style || @block_option

      @mode_specified = 'development' if @mode_specified&.start_with? 'develop'
      @mode_specified = 'production' if @mode_specified&.start_with? 'prod'
      return if @mode_specified && @mode_specified != @mode

      if @span
        <<~END_MSG
          <span class="todo#{@alert_option}#{@class_option}"#{@id_option}#{@style_option}>#{content}</span>
        END_MSG
      else
        <<~END_MSG
          <fieldset class="todo#{@alert_option}#{@class_option} rounded shadow"#{@id_option}#{@style_option}>
          <legend>TODO</legend>
            #{content}
          </fieldset>
        END_MSG
      end
    rescue StandardError => e
      @logger.error { "#{self.class} died with a #{e.full_message}" }
      exit 3
    end

    ::JekyllSupport::JekyllPluginHelper.register(self, PLUGIN_NAME)
  end
end
