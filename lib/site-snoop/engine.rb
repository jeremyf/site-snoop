require 'site-snoop/link'
module SiteSnoop
  class Engine
    attr_reader :initial_url, :urls, :visited_urls, :link_queue, :page_queue
    def initialize(initial_url)
      @initial_url = initial_url
      @urls = [initial_url]
      @visited_urls = []
      @link_queue = Queue.new
      yield(self) if block_given?
    end
    
    # Begin the site crawl.
    def start!
      SiteSnoop::Link.visit(initial_url) do |link, url, additional_links|
        visited_urls << url
      end
    end
  end
end