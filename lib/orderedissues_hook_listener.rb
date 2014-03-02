class OrderedissuesHookListener < Redmine::Hook::ViewListener
	render_on :view_layouts_base_content, :partial => "order/order_issues"
end
