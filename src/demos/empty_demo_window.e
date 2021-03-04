note
	goal: "[
		Demonstrate an plain-ole empty window that does nothing but "appear" when called for.
		]"

class
	EMPTY_DEMO_WINDOW

inherit
	EV_TITLED_WINDOW

create
	make_with_parent

feature {NONE} -- Initialization

	make_with_parent (a_parent_window: EV_TITLED_WINDOW)
			-- Initialize Current
		do
			make_with_title ("Empty Window Demo")
			set_size (800, 600)
			close_request_actions.extend (agent destroy)
			show_relative_to_window (a_parent_window)
		end

note
	design: "[
		We just want a window to show up when the button in MAIN_WINDOW is clicked.
		That is what this window is here for!
		]"

end
