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

			create left_1.make_with_text ("left 1")
			create left_2.make_with_text ("left 2")
			create left_3.make_with_text ("left 3")
			create right_1.make_with_text ("right 1")
			create right_2.make_with_text ("right 2")
			create right_3.make_with_text ("right 3")

			Precursor
		end

	initialize
			--<Precursor>
		do
			extend (main_box)
			main_box.extend (left_box)
			main_box.extend (right_box)

			left_box.extend (left_1)
			left_box.extend (left_2)
			left_box.extend (left_3)

			right_box.extend (right_1)
			right_box.extend (right_2)
			right_box.extend (right_3)

			left_box.disable_item_expand (left_2)

			right_box.disable_item_expand (right_1)
			right_box.disable_item_expand (right_3)

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
			-- As ever, a `main_box' for the window.

	left_box,
	right_box: EV_VERTICAL_BOX
			-- A left and right "box" for widgets (below).

	left_1,
	left_2,
	left_3,
	right_1,
	right_2,
	right_3: EV_BUTTON;
			-- Buttons best demo containership because you can
			-- 	see the "outlines" of the buttons to understand
			--	expanded or not-expanded.

note
	design: "[
		This is the first demo for EV_WIDGET containership and the notion of expanding.
		In the demo, we have a `main_box' as a horizontal container, so when we place
		`left_box' and `right_box', they do as you expect—one goes left and the other
		to the right, next to it. They expand to take up the entire space available to
		`main_box'. And `main_box' expands to fill the window.
		
		When you run this window, try dragging the right-lower corner of the window
		around and see how the sizing of the buttons change to consume the available
		space in the window. This is why Eiffel Vision2 chose to use this "method" to
		control sizing on contained EV_WIDGETs.
		]"
	the_semi_colon_thing_again: "Note that the only reason we need that semi-colon is because of the note."

end
