#
#  SearchTermsTableController.rb
#  PlaylistComposer
#
#  Created by Johan Lundström on 2011-06-18.
#  Copyright 2011 __MyCompanyName__. All rights reserved.
#

class SearchTermsTableController
    
    attr_accessor :table, :data, :results_table
    
    def initialize
        @data = []
    end
    
    def selected_tracks
        data.map { |term| term.result.select { |song| song.selected == true } }.flatten
    end
    
    def add(new_entries)
        data.concat(new_entries)
        table.reloadData
    end
    
    def outlineViewSelectionDidChange(notif)
        results_table.search_term = table.itemAtRow(table.selectedRow)
    end
    
    def outlineView(outlineView, child:index, ofItem:item)
        data[index]
    end
    
    def outlineView(outlineView, isItemExpandable:item)
        false
    end
    
    def outlineView(outlineView, numberOfChildrenOfItem:item)
        data.count
    end
    
    def outlineView(outlineView, objectValueForTableColumn:tableColumn, byItem:item)
        item.display
    end
end