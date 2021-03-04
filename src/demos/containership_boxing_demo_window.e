class
	CONTAINERSHIP_BOXING_DEMO_WINDOW

inherit
	EV_TITLED_WINDOW

create
	make_with_parent

feature {NONE} -- Initialization

	make_with_parent (a_parent_window: EV_TITLED_WINDOW)
			-- Init Current.
		do
			make_with_title ("Containership Demo")
			set_size (800, 600)
			close_request_actions.extend (agent destroy_and_exit_if_last)
			show_relative_to_window (a_parent_window)
		end

end
