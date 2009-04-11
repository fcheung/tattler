require 'rubygems'
require 'test/unit'

require 'active_support'
require 'active_support/test_case'
require 'action_controller'
require 'action_controller/test_process'
require 'action_controller/test_case'

$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib/")
RAILS_ROOT = File.dirname(__FILE__)
require 'tattler'


ActionController::Routing::Routes.draw do |map|
  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id'
end

ActionController::Base.view_paths = [File.dirname(__FILE__) + "/views"]