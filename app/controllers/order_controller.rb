class OrderController < ApplicationController
  unloadable


  def index
    
  end

  def create
	@issue = OrderIssue.find(params[:id])
	
	if (params[:next]) 
		@issueNext = OrderIssue.find(params[:next])
		@issue.update_position_next(@issueNext)
	elsif (params[:prev])
		@issuePrev = OrderIssue.find(params[:prev])
		@issue.update_position_prev(@issuePrev)
	else
		@issue.move_to_bottom()
	end
	
    
    render :layout => false
  end
end
