﻿note
	goal: "Demonstrate extending EV_LABEL class from Eiffel Vision2."
	ca_ignore: "CA011" 	-- Feature 'on_click_handler' has many arguments.
						--	The number of arguments of 9 is greater than or equal to
						--	the defined threshold of 4.
						--  REALITY: Tell this to Eiffel Vision routines that have such
						--				argument counts from years ago!		

class
	EV_LABEL_EXT

inherit
	EV_LABEL

create
	default_create,
	make_with_text

feature -- GUI Event Handlers

	on_click (a_agent: PROCEDURE)
			-- What happens `on_click' of Current?
		note
			design: "[
				Note the ?-marks in the agent-construct (below). These represent "open-args"
				that will be filled in from the event-handler connected up to
				`pointer_button_press_actions'. I have added another argument, that is "closed"
				with the `a_agent' argument passed in above. This is the real goal of
				this routine—getting the `on_click' to call the `a_agent' and ignore
				the extraneous information (e.g. the ?-mark arguments).
				]"
		do
			pointer_button_press_actions.extend (agent on_click_handler (?,?,?,?,?,?,?,?,a_agent))
		end

	on_double_click (a_agent: PROCEDURE)
			-- What happens `on_double_click' of Current?
		do
			pointer_double_press_actions.extend (agent on_double_click_handler (?,?,?,?,?,?,?,?,a_agent))
		end

feature {NONE} -- Implementation: GUI Event proxies

	on_click_handler (a_x, a_y, a_button: INTEGER; a_x_tilt, a_y_tilt, pressure: DOUBLE; a_screen_x, a_screen_y: INTEGER; a_agent: PROCEDURE)
			-- Proxy handler of `on_click'.
		note
			design: "[
				We are only concerned with a click-event, so we are ignoring all of the
				extra-data that is being sent in. The only thing we want is the `a_agent'.
				This is a simple call without arguments, so we can respond to the click-event.
				]"
		do
			a_agent.call (Void) -- we only use the `a_agent' arg to make the "call"
		end

	on_double_click_handler (a_x, a_y, a_button: INTEGER; a_x_tilt, a_y_tilt, pressure: DOUBLE; a_screen_x, a_screen_y: INTEGER; a_agent: PROCEDURE)
			-- Proxy handler of `on_double_click'.
		do
			a_agent.call (Void)
		end

end
