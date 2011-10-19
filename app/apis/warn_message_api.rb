# To change this template, choose Tools | Templates
# and open the template in the editor.
#class WarnMessageResult < ActionWebService::Struct
#  member :documentFiltering,          :bool
#  member :searchComments,             :string
#  member :estimatedTotalResultsCount, :int
#  member :estimateIsExact,            :bool
#  member :searchQuery,                :string
#  member :startIndex,                 :int
#  member :endIndex,                   :int
#  member :searchTips,                 :string
#  member :searchTime,                 :float
#end

class WarnMessageApi<ActionWebService::API::Base
  inflect_names false
  api_method :get_warn_messages, :expects => [:string], :returns => [:boolean]
end

