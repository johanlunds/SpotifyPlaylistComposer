#
#  AppDelegate.rb
#  PlaylistComposer
#
#  Created by Johan Lundström on 2011-06-18.
#  Copyright 2011 __MyCompanyName__. All rights reserved.
#

class AppDelegate
    
    attr_accessor :window, :playlist_id, :search_terms_table
    
    def playlist_id
        @playlist_id.nil? || @playlist_id.empty? ? nil : @playlist_id
    end
    
    def applicationDidFinishLaunching(a_notification)
        # Insert code here to initialize your application
        search_terms_table.add(songs)
    end
    
    def awakeFromNib
        window.setContentBorderThickness(32.0, forEdge:NSMinYEdge)
    end
    
    def application(sender, openFile:file)
    end
    
    def add_to_playlist(sender)
        puts "adding"
        tracks = search_terms_table.selected_tracks.map(&:spotify_uri)
        puts "adding: #{tracks}"
        RestClient.proxy = "http://localhost:8888"
        begin
            resp = RestClient.post("http://localhost:1337/playlist/#{playlist_id}/add?index=0", 
                                   tracks.to_json, :content_type => :json, :accept => :json)
        rescue Exception => e
           puts e.class.to_s, e.message, e.backtrace
        end
    end
    
    def songs
      SONGS.strip.split("\n").map do |line|
        line =~ /"(.+)" by (.+)/i
        SearchTerm.new($1, $2)
      end
    end
end

