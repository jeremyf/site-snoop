require File.dirname(__FILE__) + '/../test_helper'

class SiteSnoop::HttpTest < Test::Unit::TestCase
  def setup
    @page = FakePage.new('hello')
  end
  def test_should_have_a_get_method
    response, code, location = SiteSnoop::Http.get(@page.url)
    
    assert response
    assert_equal 200, code
    assert_equal URI.parse(@page.url), location
  end
end
