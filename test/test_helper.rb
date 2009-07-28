require 'rubygems'
require 'test/unit'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'site-snoop'
require 'fakeweb_helper'

class Test::Unit::TestCase
end


TEST_URI = 'http://www.google.com'