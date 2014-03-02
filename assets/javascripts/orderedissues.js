var originalPrev;
var originalNext;
$(('.issues tbody')).sortable({
	placeholder: "ui-state-highlight",  
    helper: function (e, ui) {
		try {
			originalPrev = ui.prev().attr('id').replace('issue-', '')
		} catch(e){}
		try {
			originalNext = ui.next().attr('id').replace('issue-', '')
		} catch(e){}
		
        ui.children().each(function () {
            $(this).width($(this).width());
        });
        return ui;
    },
    scroll: true,
    stop: function (event, ui) {
		var prev;
		var next;
		
		try {
			prev = ui.item.prev().attr('id').replace('issue-', '')
		} catch(e){}
		try {
			next = ui.item.next().attr('id').replace('issue-', '')
		} catch(e){}
		
		
		
		if (originalPrev != prev && originalNext != next) {
			$.ajax({
				url: '/order',
				type: 'post',
				data: {
						id: ui.item.attr('id').replace('issue-', ''), 
						prev: prev, 
						next: next
					}
			});
		}
        
    }
}).disableSelection();
