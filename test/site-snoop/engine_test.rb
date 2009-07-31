require File.dirname(__FILE__) + '/../test_helper'

class SiteSnoop::EngineTest < Test::Unit::TestCase
  def setup
    FakePage.new
    @engine = SiteSnoop::Engine.new(TEST_URI)
  end
  def test_start_should_visit_initial_url
    @engine.start!
    assert @engine.visited_urls.include?(TEST_URI)
  end
end
