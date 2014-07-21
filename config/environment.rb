# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Scholar::Application.initialize!

Paperclip.options[:command_path] = '/usr/local/bin'

ENV['PATH'] = '/usr/local/bin:' + ENV['PATH']
