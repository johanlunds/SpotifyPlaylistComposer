#
#  SearchTerm.rb
#  PlaylistComposer
#
#  Created by Johan Lundström on 2011-06-18.
#  Copyright 2011 __MyCompanyName__. All rights reserved.
#

class SearchTerm
    
    attr_reader :value, :result
    
    def initialize(term, artist)
        @value = term
        @result = nil
        @artist = artist
        set_result
    end
    
    def set_result
        @result = MetaSpotify::Track.search(value)[:tracks].map { |r| Song.new(r) }
    end
    
    def display
      %Q("#{@value}" by #{@artist})
    end
end