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
			make_with_title ("Eiffel Project Creator")
			set_size (800, 600)
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
			create box_demo_button.make_with_text ("Box Demo Window")
		end

	initialize
			--<Precursor>
		note
			usage: "[
				Setup of GUI elements created in `create_interface_objects
				goes here. The Precursor call must remain.
				]"
		do
			-- Your code precedes.
			Precursor

			-- Extending
			extend (main_box)
			main_box.extend (button_box)
			button_box.extend (box_demo_button)

			-- Formatting
			main_box.disable_item_expand (button_box)
			button_box.disable_item_expand (box_demo_button)
			button_box.set_padding (3)
			button_box.set_border_width (3)

			-- Actions
			box_demo_button.select_actions.extend (agent on_box_demo_button_click)
		end

feature {NONE} -- Implementation: GUI Objects

	-- GUI Object features here (Example: my_button: EV_BUTTON)

	main_box: EV_VERTICAL_BOX

	button_box: EV_HORIZONTAL_BOX

	box_demo_button: EV_BUTTON

feature {NONE} -- Implementation: GUI Events

	-- GUI Event-handlers here (on_my_button_click)

	on_box_demo_button_click
			-- What happens when `box_demo_button' is clicked.
		local
			l_demo: BOX_DEMO_WINDOW
		do
			create l_demo.make
			l_demo.show
		end

end
