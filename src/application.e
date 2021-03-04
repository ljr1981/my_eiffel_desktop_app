class
	APPLICATION

create
	make

feature  -- Initialization

	make
			-- Run application.
		do
			create application
			create main_window.make

			main_window.close_request_actions.extend (agent application.destroy)
			application.post_launch_actions.extend (agent main_window.show)
			
			application.launch
		end

feature {NONE} -- Implementation

	application: EV_APPLICATION
			-- Primary `application' (event loop).

	main_window: MAIN_WINDOW
			-- The `application' `main_window'.

end
