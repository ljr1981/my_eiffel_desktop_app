class
	EV_BUTTON_EXT

inherit
	EV_BUTTON

create
	default_create,
	make_with_text,
	make_with_text_and_action

feature -- GUI Event Agents

	on_click (a_agent: PROCEDURE)
			-- What happens `on_click' of Current?
		do
			select_actions.extend (a_agent)
		end

note
	design: "[
		The Vision2 classes can be improved in terms of readability. You may want
		to consider creating "helper" specializations like this one to ease your
		coding-time and improve readability of your overall code.
		]"

end
