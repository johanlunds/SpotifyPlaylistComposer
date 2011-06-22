#
#  Search.rb
#  PlaylistComposer
#
#  Created by Johan Lundström on 2011-06-18.
#  Copyright 2011 __MyCompanyName__. All rights reserved.
#



class Search # < NSOperation

    def initialize(term)
        #init
        @term = term
    end
    
    def main
        begin
        puts "starting search: #{@term}"
        
        @term.set_result(result)
            #        @term.performSelectorOnMainThread(:set_result, withObject:result, waitUntilDone:true)
            rescue Exception => e
            puts e.inspect
            end
    end
end
