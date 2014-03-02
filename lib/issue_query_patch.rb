require_dependency 'issue_query'



module IssueQueryPatch
	def self.included(base) # :nodoc:
		base.send(:include, InstanceMethods)
		base.class_eval do
			 self.available_columns << QueryColumn.new(:position, :sortable => "#{Issue.table_name}.position")
		end
	end
	
	module InstanceMethods
	end
end

IssueQuery.send(:include, IssueQueryPatch) unless IssueQuery.included_modules.include? IssueQueryPatch
