#
#  SearchTerm.rb
#  PlaylistComposer
#
#  Created by Johan Lundström on 2011-06-18.
#  Copyright 2011 __MyCompanyName__. All rights reserved.
#

require 'observer'

class SearchTerm
    
    include Observable
    
    attr_reader :value
    
    def initialize(term, artist)
        @value = term
        @_result = nil
        @artist = artist
        @semaphore = Mutex.new
        @_searching = false
    end
    
    def result
        @semaphore.synchronize do
            @_result
        end
    end
    
    def result=(val)
        @semaphore.synchronize do
            @_result = val
            @_searching = false
        end
    end
    
    def search(delegate)
        @semaphore.synchronize do
            return if @_searching
            @_searching = true
            Thread.new do
                self.result = MetaSpotify::Track.search(value)[:tracks].map { |r| Song.new(r) }
                delegate.performSelectorOnMainThread('search_finished:', withObject:self, waitUntilDone:false)
            end
        end
    end
    
    def display
      %Q("#{@value}" by #{@artist})
    end
end