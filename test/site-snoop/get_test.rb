require File.dirname(__FILE__) + '/../test_helper'

class SiteSnoop::GetTest < Test::Unit::TestCase
  def test_should_have_a_response_method
    SiteSnoop::Get.response(FakePage.new('/hello'))
  end
end
