note
	goal: "[
		Demonstration of {EV_PRIMITIVE} classes in a "Notebook" (tabbed).
		]"

class
	EV_PRIMITIVE_DEMO_WINDOW


inherit
	EV_TITLED_WINDOW
		redefine
			create_interface_objects,
			initialize
		end

create
	make_with_parent

feature {NONE} -- Implementation

	create_interface_objects
			--<Precursor>
		do
			create notebook
			create button_cell
			create gauge_cell
			create label_cell
			create lists_cell
			create pixmaps_cell
			create text_components_cell
			create treeviews_cell

			Precursor
		end

	initialize
			--<Precursor>
		do
			-- Extending
			extend (notebook)
			notebook.extend (button_cell)
			notebook.extend (gauge_cell)
			notebook.extend (label_cell)
			notebook.extend (lists_cell)
			notebook.extend (pixmaps_cell)
			notebook.extend (text_components_cell)
			notebook.extend (treeviews_cell)

			-- Formatting
			button_tab.set_text ("Buttons")
			gauge_tab.set_text ("Gauges")
			label_tab.set_text ("Labels")
			lists_tab.set_text ("Lists")
			pixmaps_tab.set_text ("Pixmaps")
			text_components_tab.set_text ("Text")
			treeviews_tab.set_text ("Treeviews")

			Precursor
		end

	make_with_parent (a_parent_window: EV_TITLED_WINDOW)
			-- Init Current with `a_parent_window'.
		do
			make_with_title ("Primitives Demo")
			set_size (800, 600)
			close_request_actions.extend (agent destroy)
			show_relative_to_window (a_parent_window)
		end

feature {NONE} -- Implementation: GUI Objects

	notebook: EV_NOTEBOOK
			-- Demo of notebooks with tabs (see below)

	button_cell: EV_CELL
	button_tab: EV_NOTEBOOK_TAB
			-- Demo of buttons
		attribute
			Result := notebook.item_tab (button_cell)
		end

	gauge_cell: EV_CELL
	gauge_tab: EV_NOTEBOOK_TAB
			-- Demo of gauges
		attribute
			Result := notebook.item_tab (gauge_cell)
		end

	label_cell: EV_CELL
	label_tab: EV_NOTEBOOK_TAB
			-- Demo of labels
		attribute
			Result := notebook.item_tab (label_cell)
		end

	lists_cell: EV_CELL
	lists_tab: EV_NOTEBOOK_TAB
			-- Demo of labels
		attribute
			Result := notebook.item_tab (lists_cell)
		end

	pixmaps_cell: EV_CELL
	pixmaps_tab: EV_NOTEBOOK_TAB
			-- Demo of labels
		attribute
			Result := notebook.item_tab (pixmaps_cell)
		end

	text_components_cell: EV_CELL
	text_components_tab: EV_NOTEBOOK_TAB
			-- Demo of labels
		attribute
			Result := notebook.item_tab (text_components_cell)
		end

	treeviews_cell: EV_CELL
	treeviews_tab: EV_NOTEBOOK_TAB
			-- Demo of labels
		attribute
			Result := notebook.item_tab (treeviews_cell)
		end

feature {NONE} -- Implementation: GUI Events



note
	design: "[
		Inheritance-tree looking down from {EV_WIDGET}:
		
		{EV_WIDGET}
			{EV_CONTAINER}
			{EV_PRIMITIVE}
			
		This class is about the primitives. In the Class Context Tool, "Class" text-box,
		type in EV_PRIMITIVE and then select the "Descendants" button on the toolbar. You will
		see an inheritance list (looking downward from {EV_PRIMITIVE}) like:
		
		EV_PRIMITIVE
			EV_BUTTON						-- Standard buttons
				EV_RADIO_BUTTON				-- Radio button
				EV_TOGGLE_BUTTON			-- Toggle on-off
					EV_CHECK_BUTTON			-- Checkboxes
			EV_GAUGE
				EV_RANGE					-- Range with slider
				EV_SPIN_BUTTON				-- Spinner
			EV_LABEL						-- Standard label
			EV_LIST_ITEM_LIST
				EV_COMBO_BOX				-- Combo-box (editable or non)
				EV_LIST						-- List
			EV_MULTI_COLUMN_LIST			-- List with multiple columns
			EV_PIXMAP						-- Pixmap for PNG/JPG/BMP
			EV_TEXT_COMPONENT
				EV_TEXT
					EV_RICH_TEXT			-- Rich-text like RTF
				EV_TEXT_FIELD				-- Standard text-boxes
					EV_COMBO_BOX			-- (see above)
					EV_SPIN_BUTTON			-- (see above)
			EV_TOOL_BAR						-- Toolbars
			EV_TREE							-- Treeviews
				EV_CHECKABLE_TREE			-- Checkable treeviews
		]"

end
