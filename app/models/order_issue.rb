class OrderIssue < Issue
  unloadable
  
	def update_position_next(issueNext)
		self.class.connection.execute("update #{self.class.table_name} set position = position + 1 where position >= #{issueNext.position}")
		self.class.connection.execute("update #{self.class.table_name} set position = #{issueNext.position}  where id = #{self.id}")

		#Rails.logger.debug("My object: #{self}")
	end
	
	def update_position_prev(issuePrev)
		self.class.connection.execute("update #{self.class.table_name} set position = position - 1 where position >= #{issuePrev.position}")
		self.class.connection.execute("update #{self.class.table_name} set position = #{issuePrev.position}  where id = #{self.id}")

		#Rails.logger.debug("My object: #{self}")
	end
  
	def move_to_bottom()
		bottom = self.class.maximum(:position)
		Rails.logger.debug("My object: #{bottom}")
		self.class.connection.execute("update #{self.class.table_name} set position = #{bottom}+1  where id = #{self.id}")
	end
end
