note
	goal: "[
		Demostrate how to set up a window with a single, simple button control.
		]"
	ca_ignore: "CA022" 	-- Class 'MAIN_WINDOW' contains unreachable code
						--	that should be considered to be removed.
						--	REALITY: The structure of the code is okay.


class
	MAIN_WINDOW

inherit
	EV_TITLED_WINDOW
		redefine
			create_interface_objects,
			initialize
		end

create
	make

feature {NONE} -- Initialization

	make
			-- Init Current
		do
			-- Overall window formatting and other matters are best handled here.
			make_with_title ("Eiffel Project Creator")
			set_size (800, 600)
			close_request_actions.extend (agent destroy_and_exit_if_last)
		end

	create_interface_objects
			--<Precursor>
		note
			usage: "[
				creation calls for all `main_window' GUI elements
				goes here. There Precursor call must remain.
				]"
		do
			Precursor
			-- Boxes
			create main_box
			create button_box
			-- Buttons
			create empty_demo_button.make_with_text ("Box Demo Window")
			create menu_demo_button.make_with_text ("Menu Demo Window")
		end

	initialize
			--<Precursor>
		note
			usage: "[
				Setup of GUI elements created in `create_interface_objects
				goes here. The Precursor call must remain.
				]"
		do
			-- Extending
			extend (main_box)
			main_box.extend (button_box)
			button_box.extend (empty_demo_button)
			button_box.extend (menu_demo_button)

			-- Formatting
			main_box.disable_item_expand (button_box)
			button_box.disable_item_expand (empty_demo_button)
			button_box.disable_item_expand (menu_demo_button)
			button_box.set_padding (3)
			button_box.set_border_width (3)

			-- Actions
			empty_demo_button.select_actions.extend (agent on_empty_demo_button_click)
			menu_demo_button.select_actions.extend (agent on_menu_demo_button_click)

			-- Your code generally precedes.
			Precursor
		end

feature {NONE} -- Implementation: GUI Objects

	-- GUI Object features here (Example: my_button: EV_BUTTON)

	main_box: EV_VERTICAL_BOX
			-- The primary "box" for the window.

	button_box: EV_HORIZONTAL_BOX
			-- A box for buttons (design choice-not best-practice)
			-- You have a blank slate on containership/organization.

	empty_demo_button: EV_BUTTON
			-- A button to launch another window.
			-- There are many ways to launch windows and perform
			-- other tasking (this is what agents perfect for).

	menu_demo_button: EV_BUTTON
			-- A menuing window demo.

feature {NONE} -- Implementation: GUI Events

	-- GUI Event-handlers here (on_my_button_click)

	on_empty_demo_button_click
			-- What happens when `empty_demo_button' is clicked.
		do
			(create {EMPTY_DEMO_WINDOW}.make_with_parent (Current)).do_nothing
		end

	on_menu_demo_button_click
			-- What happens when `menu_demo_button' is clicked.
		do
			(create {MENU_ENABLED_WINDOW}.make_with_parent (Current)).do_nothing
		end

note
	pay_attention: "Note that there is no semi-colon as in APPLICATION."
	design: "[
		This design is going to be a bit more complex. Over the years, I have learned to
		organize my window-creation into a few broad strokes:
		
		1. Always do redefines of create_interface_objects and initialize.
			WHY?: Making a window requires GUI objects and they need initialization.
		2. Never do containership or formatting tasks in create_interface_objects.
			WHY?: creation is only about creation. You're best-off to keep it that way.
		3. Split the intialization of GUI objects into phases:
			a. Extending—handling containership tasks
			b. Formatting—how things appear visually
			c. Actions—how things behave and respond to events.
			d. Other—misc tasks (if any)
			e. Precursor call—pay attention here. Your Precursor call might go in the middle.
		]"

end
