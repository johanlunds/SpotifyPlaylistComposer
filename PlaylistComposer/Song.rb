#
#  Song.rb
#  PlaylistComposer
#
#  Created by Johan Lundström on 2011-06-18.
#  Copyright 2011 __MyCompanyName__. All rights reserved.
#

class Song
    
    attr_accessor :selected
    
    def initialize(wrapped)
        @wrapped = wrapped
        @selected = false
    end
    
    def artist
        @wrapped.artists.map(&:name).join(', ')
    end
    
    def track
        @wrapped.name
    end
    
    def time
        @wrapped.length.to_i
    end
    
    def album
        @wrapped.album.name
    end
    
    def spotify_uri
       @wrapped.uri 
    end
end