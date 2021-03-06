note
	goal: "[
		Demonstration of {EV_GRID} classes in a "Notebook" (tabbed).
		]"


class
	EV_GRID_DEMO_WINDOW

inherit
	EV_TITLED_WINDOW_ORGANIZED_INIT
		redefine
			create_interface_objects
		end

create
	make_with_parent


feature {NONE} -- Initialize

	create_interface_objects
			--<Precursor>
		do
			create notebook
			create basic_grid_box
			create basic_grid

			Precursor
		end

	make_with_parent (a_parent_window: EV_TITLED_WINDOW)
			--
		do
			make_with_title ("Grid Demo")
			set_size (800, 600)
			close_request_actions.extend (agent destroy)
			show_relative_to_window (a_parent_window)
		end

feature {NONE} -- Initialization: Helpers

	init_extend_containerships
			-- Initialize GUI element containership extending.
		do
			extend (notebook)
			notebook.extend (basic_grid_box)
			basic_grid_box.extend (basic_grid)
		end

	init_set_text_content
			-- Initialize GUI element text contents.
		do
			basic_tab.set_text ("Basic")
		end

	init_text_formatting
			-- Initialize GUI element text formatting.
		do
			basic_grid.set_minimum_size (300, 300)
			basic_grid.set_item (1, 1, create {EV_GRID_LABEL_ITEM}.make_with_text ("Item 1, 1"))
			basic_grid.set_item (2, 1, create {EV_GRID_LABEL_ITEM}.make_with_text ("Item 2, 1"))
			basic_grid.set_item (1, 2, create {EV_GRID_LABEL_ITEM}.make_with_text ("Item 1, 2"))
			basic_grid.set_item (2, 2, create {EV_GRID_LABEL_ITEM}.make_with_text ("Item 2, 2"))
			basic_grid.column (1).set_title ("Column 1")
			basic_grid.column (2).set_title ("Column 2")
		end

	init_colorization
			-- Initialize GUI element colorizing.
		do

		end

	init_sizing
			-- Initialize GUI element sizing.
		do

		end

	init_padding_and_border
			-- Initialize GUI container padding and border
		do

		end

	default_padding_and_border: INTEGER
			--
		do

		end

	init_pixmaps
			-- Initializes GUI object pixmaps.
		do

		end

	init_gui_object_events
			-- Initialize GUI object events.
		do

		end

	init_disabling_of_item_expands
			-- Initialize disable of item expanding.
		do

		end

feature -- GUI Objects

	notebook: EV_NOTEBOOK
			-- Demo of notebooks with tabs (see below)

	basic_grid_box: EV_VERTICAL_BOX
	basic_grid: EV_GRID
	basic_tab: EV_NOTEBOOK_TAB
			-- Demo of Basic Grid
		attribute
			Result := notebook.item_tab (basic_grid_box)
		end

end
