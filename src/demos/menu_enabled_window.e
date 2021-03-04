note
	goal: "[
		Demonstrate a window with a menu system.
		]"

class
	MENU_ENABLED_WINDOW

inherit
	EV_TITLED_WINDOW

create
	make_with_parent

feature {NONE} -- Initialization

	make_with_parent (a_parent_window: EV_TITLED_WINDOW)
			-- Initialize Current.
		do
			make_with_title ("Example Menu Window")
			set_size (800, 600)
			close_request_actions.extend (agent destroy)

			set_menu_bar (window_menu_bar)

			show_relative_to_window (a_parent_window)
		end

feature {NONE} -- Initialization: Menu

	window_menu_bar: EV_MENU_BAR
			-- Generate a `window_menu_bar'.
		do
			create Result
			Result.extend (file_menu)
			Result.extend (demos_menu)
		end


	file_menu: EV_MENU
			-- Generate a `file_menu'.
		do
			create Result.make_with_text ("&File")
			Result.extend (file_new)
			Result.extend (create {EV_MENU_SEPARATOR})
			Result.extend (file_exit)
		end

	demos_menu: EV_MENU
			-- Generate a `demos_menu'.
		do
			create Result.make_with_text ("&Demos")
			Result.extend (demo_gui_containership)
			Result.extend (demo_primitives)
		end

feature -- Menu Elements

	file_new: EV_MENU_ITEM
			-- Main window File -> New menu.
		do
			create Result.make_with_text_and_action ("&New", agent on_file_new_click)
		end

	file_exit: EV_MENU_ITEM
			-- Main window File -> Exit menu.
		do
			create Result.make_with_text_and_action ("E&xit", agent on_file_exit_click)
		end

feature -- Menu Elements: Demos

	demo_gui_containership: EV_MENU_ITEM
			-- Containership demonstration
		do
			create Result.make_with_text_and_action ("&Containership demo", agent on_demo_gui_containership_click)
		end

	demo_primitives: EV_MENU_ITEM
			-- Primitives demo
		do
			create Result.make_with_text_and_action ("&Primitives demo", agent on_demo_primitives_click)
		end

feature -- Event Operations

	on_file_new_click
			-- What happens when the File -> New menu item is clicked?
		do
			(create {EMPTY_DEMO_WINDOW}.make_with_parent (Current)).do_nothing
		end

	on_file_exit_click
			-- What happens when the File -> Exit menu item is clicked?
		do
			destroy
		end

	on_demo_gui_containership_click
			-- What happens when the Demos -> Containership demo is clicked?
		do
			(create {CONTAINERSHIP_BOXING_DEMO_WINDOW}.make_with_parent (Current)).do_nothing
		end

	on_demo_primitives_click
			--
		do
			(create {EV_PRIMITIVE_DEMO_WINDOW}.make_with_parent (Current)).do_nothing
		end

note
	design: "[
		Not only do we want to demo how to give a window a menu system, but
		how to perform various tasks when menu-options are selected by the user.
		
		Steps:
		
		1. We create the window as-usual in the `make_with_parent'.
		2. We add a call to `window_menu_bar', which builds our menu-bar.
		3. We add the menu-bar to the Current window.
		
		Again—there are three major parts:
		
		A) Creation parts, where we make the menu.
		B) GUI object creation and setup.
		C) GUI event-handlers that respond to user-selection of menu-items.
		]"

end
