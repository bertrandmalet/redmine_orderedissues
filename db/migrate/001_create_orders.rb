class CreateOrders < ActiveRecord::Migration
  
  
  def change
	add_column :issues, :position, :integer, :default => 0
    create_table :orders do |t|
      t.integer :issue_id
      t.integer :prev
      t.integer :next
    end
    execute "UPDATE issues SET POSITION = id"
  end
end
