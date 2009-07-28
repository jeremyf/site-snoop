require 'site-snoop/get'
module SiteSnoop
  class Link
    def self.visit(*args, &block)
      self.new(*args).visit(&block)
    end

    attr_reader :target_url, :referrer_url
    def initialize(target_url, referrer_url = nil)
      @target_url = target_url
      @referrer_url = referrer_url
      @headers = {}
    end
    
    def visit
      response 
      yield(self, target_url, links_in_target_document)
    end

    protected
    def links_in_target_document
      return @links_in_target_document if @links_in_target_document
    end
  
    def response
      @response ||= SiteSnoop::Get.response(target_url) 
    end
  end
end