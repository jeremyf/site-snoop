require File.dirname(__FILE__) + '/../test_helper'

class SiteSnoop::LinkTest < Test::Unit::TestCase
  def setup
    @referrer_url = TEST_URI
    @target_url = File.join(TEST_URI, '/hello')
    @links_at_target_url = ['/hello/world', '/hello/mom']
    FakePage.new('hello', :links => @links_at_target_url)
    @link = SiteSnoop::Link.new(@target_url, @referrer_url)
  end
  def test_should_have_referrer_url
    assert_equal @referrer_url, @link.referrer_url
  end

  def test_should_have_target_url
    assert_equal @target_url, @link.target_url
  end
  
  def test_visit_should_yield_target_url
    @link.visit do |link, url, links_in_target_document|
      @yielded = url
    end
    assert_equal @target_url, @yielded
  end

  def test_visit_should_yield_link
    @link.visit do |link, url, links_in_target_document|
      @yielded = link
    end
    assert_equal @link, @yielded
  end

  def test_visit_should_yield_links_in_target_document
    @link.visit do |link, url, links_in_target_document|
      @yielded = links_in_target_document
    end
    # assert_equal @links_at_target_url, @yielded
  end
    
end
