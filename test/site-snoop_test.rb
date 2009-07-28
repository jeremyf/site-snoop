require File.dirname(__FILE__) + '/test_helper'

class SiteSnoopTest < Test::Unit::TestCase
  def setup
    SiteSnoop.start_at(TEST_URI) do |engine|
      @yielded = engine
    end    
  end
  def test_start_at_should_yield_an_object_that_starts!
    assert_respond_to @yielded, :start!
  end
  def test_start_at_should_yield_an_object_that_has_an_initial_url
    assert_equal TEST_URI, @yielded.initial_url
  end
end
