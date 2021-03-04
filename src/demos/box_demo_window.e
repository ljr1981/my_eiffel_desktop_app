class
	BOX_DEMO_WINDOW

inherit
	EV_TITLED_WINDOW

create
	make

feature {NONE} -- Initialization

	make
			-- Init Current.
		do
			make_with_title ("Box Demo")
			set_size (800, 600)
			close_request_actions.extend (agent destroy_and_exit_if_last)
		end

end
