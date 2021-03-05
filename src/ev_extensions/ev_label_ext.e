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
		do
			pointer_button_press_actions.extend (agent on_click_handler (?,?,?,?,?,?,?,?,a_agent))
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
			a_agent.call (Void)
		end

end
