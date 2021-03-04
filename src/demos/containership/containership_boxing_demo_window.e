note
	goal: "[
		Demonstration of how visual and non-visual EV_WIDGET containership works in Eiffel Vision2.
		]"
	EIS: "name:Containership_and_Expansion",
			"src=https://github.com/ljr1981/my_eiffel_desktop_app/blob/main/src/demos/containership/Containership_and_Expansion.pdf"

class
	CONTAINERSHIP_BOXING_DEMO_WINDOW

inherit
	EV_TITLED_WINDOW
		redefine
			create_interface_objects,
			initialize
		end

create
	make_with_parent

feature {NONE} -- Initialization

	create_interface_objects
			--<Precursor>
		do
			create main_box
			create left_box
			create right_box

			create left_label_1.make_with_text ("left 1")
			create left_label_2.make_with_text ("left 2")
			create left_label_3.make_with_text ("left 3")
			create right_label_1.make_with_text ("right 1")
			create right_label_2.make_with_text ("right 2")
			create right_label_3.make_with_text ("right 3")

			Precursor
		end

	initialize
			--<Precursor>
		do
			extend (main_box)
			main_box.extend (left_box)
			main_box.extend (right_box)

			left_box.extend (left_label_1)
			left_box.extend (left_label_2)
			left_box.extend (left_label_3)

			right_box.extend (right_label_1)
			right_box.extend (right_label_2)
			right_box.extend (right_label_3)

			left_box.disable_item_expand (left_label_2)

			right_box.disable_item_expand (right_label_1)
			right_box.disable_item_expand (right_label_3)

			Precursor
		end

	make_with_parent (a_parent_window: EV_TITLED_WINDOW)
			-- Init Current.
		do
			make_with_title ("Containership Demo")
			set_size (800, 600)
			close_request_actions.extend (agent destroy_and_exit_if_last)
			show_relative_to_window (a_parent_window)
		end

feature {NONE} -- Implementation: GUI Elements

	main_box: EV_HORIZONTAL_BOX

	left_box,
	right_box: EV_VERTICAL_BOX

	left_label_1,
	left_label_2,
	left_label_3,
	right_label_1,
	right_label_2,
	right_label_3: EV_BUTTON


end
