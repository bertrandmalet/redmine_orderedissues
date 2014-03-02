require 'redmine'

require_dependency 'orderedissues_hook_listener'
require_dependency 'issue_query_patch'

Redmine::Plugin.register :redmine_orderedissues do
  name 'Redmine Ordered Issues plugin'
  author 'Bertrand Malet'
  version '0.0.1'
end
