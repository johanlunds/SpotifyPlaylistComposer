#
#  ResultsTableController.rb
#  PlaylistComposer
#
#  Created by Johan Lundström on 2011-06-18.
#  Copyright 2011 __MyCompanyName__. All rights reserved.
#

class ResultsTableController
    
    attr_accessor :table, :data
    
    def initialize
        @term = nil
        @data = []
        # @queue = NSOperationQueue.alloc.init
        #@queue.setMaxConcurrentOperationCount(1)
    end
    
    def search_term=(val)
        @term = val
        @data = []
        table.reloadData
        if val.result
            search_finished(val) 
        else
            #@queue.addOperation(Search.alloc.initWithTerm(val))
            val.set_result
            search_finished(val) 
        end
    end
    
    def search_finished(term)
        @data = term.result
        table.reloadData
    end
    
    def tableView(aTableView, objectValueForTableColumn:aTableColumn, row:rowIndex)
        data[rowIndex].send(aTableColumn.identifier.to_sym)
    end
    
    def numberOfRowsInTableView(aTableView)
        data.count
    end
    
    def tableView(table, setObjectValue:object, forTableColumn:col, row:index)
        data[index].selected = object
    end
end