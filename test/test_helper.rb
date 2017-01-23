ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters" # arpher add
Minitest::Reporters.use!     # arpher add

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper  # arpher add

  # Add more helper methods to be used by all tests here...
  
  # 如果用户已登录，返回 true
  def is_logged_in?
    !session[:user_id].nil?
  end
end
