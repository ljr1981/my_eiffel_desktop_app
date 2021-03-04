note
	goal: "[
		Demonstrate an plain-ole empty window that does nothing but "appear" when called for.
		]"

class
	EMPTY_DEMO_WINDOW

inherit
	EV_TITLED_WINDOW

create
	make

feature {NONE} -- Initialization

	make
			-- Initialize Current
		do
			make_with_title ("Empty Window Demo")
			set_size (800, 600)
			close_request_actions.extend (agent destroy_and_exit_if_last)
		end

note
	design: "[
		We just want a window to show up when the button in MAIN_WINDOW is clicked.
		That is what this window is here for!
		]"

end
