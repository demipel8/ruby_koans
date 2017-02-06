require File.expand_path(File.dirname(__FILE__) + '/neo')
require 'singleton'

class AboutSingleton < Neo::Koan

  class SingletonClass
    include Singleton

    def isSingleton?
      true
    end
  end

  def test_call_singleton_using_instance
    assert_equal SingletonClass.instance.isSingleton?, __(true)
  end

  def test_new_method_on_singleton_fails
    result = nil
    begin
      SingletonClass.new
    rescue StandardError => ex
      result = :exception_handled
    end

    assert_equal :exception_handled, result

    assert_equal __(true), ex.is_a?(StandardError), "Should be a Standard Error"
    assert_equal __(true), ex.is_a?(NoMethodError),  "Should be a NoMethodError Error"

    assert_equal __("private method `new' called for AboutSingleton::SingletonClass:Class"
), ex.message
  end
end