ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  fixtures :all

  # Returns true if a test user is logged in.
  def is_logged_in?
    !session[:techer_id].nil?
  end

  # Log in as a particular user.
  def log_in_as(teacher)
    session[:teacher_id] = teacher.id
  end
end

class ActionDispatch::IntegrationTest

  # Log in as a particular user.
  def log_in_as(teacher, password: 'password', remember_me: '1')
    post login_path, params: { session: { user_name: teacher.user_name,
                                          password: password,
                                          remember_me: remember_me } }
  end
end