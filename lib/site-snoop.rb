module SiteSnoop
  def self.start_at(url)
    SiteSnoop::Engine.new(url) do |engine|
      yield(engine)
      engine.start!
    end
  end
end
require 'site-snoop/engine'