note
	goal: "[
		Demonstration of {EV_PRIMITIVE} classes in a "Notebook" (tabbed).
		]"

	EIS: "name=vision_demo_dir", "src=$(ISE_EIFFEL)\vision2_demo\spec\win64\bin"
	EIS: "name=vision_demo_exe", "src=$(ISE_EIFFEL)\vision2_demo\spec\win64\bin\vision2_demo.exe"
	EIS: "name=eiffel_image_embed_dir", "src=$(ISE_EIFFEL)\tools\spec\win64\bin"
	EIS: "name=eiffel_image_embed_exe", "src=$(ISE_EIFFEL)\tools\spec\win64\bin\eimgemb.exe"

	ca_ignore: "CA022" 	-- Class 'EV_PRIMITIVE_DEMO_WINDOW' contains unreachable code
						--	that should be considered to be removed.
						--	REALITY: The structure of the code is okay.

class
	EV_PRIMITIVE_DEMO_WINDOW

inherit
	EV_TITLED_WINDOW_ORGANIZED_INIT
		redefine
			create_interface_objects
		end

create
	make_with_parent

feature {NONE} -- Implementation

	create_interface_objects
			--<Precursor>
		do
			create notebook

			create button_box
			create button_1_2_splitter
			create button_1_frame.make_with_text ("Standard button with text")
			create button_1.make_with_text ("Button 1")
			create button_2_frame.make_with_text ("Another button")
			create button_2.make_with_text ("Button 2")

			create spinner_box
			create spinner_1.make_with_value_range (1 |..| 1_000)

			create label_box
			create label_1

			create lists_box
			create pixmaps_box
			create text_components_box
			create treeviews_box

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

feature {NONE} -- Implementation: Extending Initializations

	init_extend_containerships
			--<Precursor>
		do
			extend (notebook)
			extend_into_button_box
			extend_into_gauge_box
			extend_into_label_box
			extend_into_lists_box
			extend_into_pixmaps_box
			extend_into_text_components_box
			extend_into_treeviews_box
		end

	extend_into_button_box
			-- Extend button demo material into `button_box'
		do
			notebook.extend (button_box)
				-- Lets add a vertical-splitter to make this more interesting ...
			if attached (create {EV_FRAME}.make_with_text ("Buttons in splitter")) as al_splitter_frame then
				button_box.extend (al_splitter_frame)
				al_splitter_frame.extend (button_1_2_splitter)

				-- `button_1' and its frame go in first (upper)
				button_1_2_splitter.extend (button_1_frame)
				button_1_frame.extend (button_1)

				-- `button_2' and its frame go in next (lower)
				button_1_2_splitter.extend (button_2_frame)
				button_2_frame.extend (button_2)
			end
		end

	extend_into_gauge_box
			-- Extend gauge demo material
		do
			notebook.extend (spinner_box)
			spinner_box.extend (spinner_1)
		end

	extend_into_label_box
			-- Extend label demo material
		do
			notebook.extend (label_box)
			label_box.extend (label_1)
		end

	extend_into_lists_box
			-- Extend lists demo material
		do
			notebook.extend (lists_box)
		end

	extend_into_pixmaps_box
			-- Extend pixmaps demo material
		do
			notebook.extend (pixmaps_box)
		end

	extend_into_text_components_box
			-- Extend text-components demo material
		do
			notebook.extend (text_components_box)
		end

	extend_into_treeviews_box
			-- Extend treeview demo material
		do
			notebook.extend (treeviews_box)
		end

feature {NONE} -- Implementation: Initializations

	init_set_text_content
			--<Precursor>
		do
			button_tab.set_text ("Buttons")
			spinner_tab.set_text ("Gauges")
			label_tab.set_text ("Labels")
			lists_tab.set_text ("Lists")
			pixmaps_tab.set_text ("Pixmaps")
			text_components_tab.set_text ("Text")
			treeviews_tab.set_text ("Treeviews")

			spinner_1.set_text ("Spinner 1")
			label_1.set_text ("Label 1")
		end

	init_text_formatting
			--<Precursor>
		do

		end

	init_colorization
			--<Precursor>
		do
			treeviews_box.set_background_color ((create {EV_STOCK_COLORS}).Green)
		end

	init_sizing
			--<Precursor>
		do

		end

	init_padding_and_border
			--<Precursor>
		do
			set_padding_and_border (button_box)
			set_padding_and_border (spinner_box)
			set_padding_and_border (label_box)
			set_padding_and_border (lists_box)
			set_padding_and_border (pixmaps_box)
			set_padding_and_border (text_components_box)
			set_padding_and_border (treeviews_box)
		end

	default_padding_and_border: INTEGER = 3
			--<Precursor>

	init_pixmaps
			--<Precursor>
		do

		end

	init_gui_object_events
			--<Precursor>
		do

		end

	init_disabling_of_item_expands
			--<Precursor>
		do
			disable_item_expanding (spinner_box, spinner_1)
			disable_item_expanding (label_box, label_1)
		end

feature {NONE} -- Implementation: GUI Objects

	notebook: EV_NOTEBOOK
			-- Demo of notebooks with tabs (see below)

	button_box: EV_VERTICAL_BOX
	button_1_2_splitter: EV_VERTICAL_SPLIT_AREA
	button_1_frame,
	button_2_frame: EV_FRAME
	button_1,
	button_2: EV_BUTTON
	button_tab: EV_NOTEBOOK_TAB
			-- Demo of buttons
		attribute
			Result := notebook.item_tab (button_box)
		end

	spinner_box: EV_VERTICAL_BOX
	spinner_1: EV_SPIN_BUTTON
	spinner_tab: EV_NOTEBOOK_TAB
			-- Demo of spinners
		attribute
			Result := notebook.item_tab (spinner_box)
		end

	label_box: EV_VERTICAL_BOX
	label_1: EV_LABEL
	label_tab: EV_NOTEBOOK_TAB
			-- Demo of labels
		attribute
			Result := notebook.item_tab (label_box)
		end

	lists_box: EV_VERTICAL_BOX
	lists_tab: EV_NOTEBOOK_TAB
			-- Demo of labels
		attribute
			Result := notebook.item_tab (lists_box)
		end

	pixmaps_box: EV_VERTICAL_BOX
	pixmaps_tab: EV_NOTEBOOK_TAB
			-- Demo of labels
		attribute
			Result := notebook.item_tab (pixmaps_box)
		end

	text_components_box: EV_VERTICAL_BOX
	text_components_tab: EV_NOTEBOOK_TAB
			-- Demo of labels
		attribute
			Result := notebook.item_tab (text_components_box)
		end

	treeviews_box: EV_VERTICAL_BOX
	treeviews_tab: EV_NOTEBOOK_TAB
			-- Demo of labels
		attribute
			Result := notebook.item_tab (treeviews_box)
		end

feature {NONE} -- Implementation: GUI Events

	-- Coming ...

note
	design: "[
		The basic design is to demo each {EV_PRIMITIVE} within a tab of an overall notebook.
		
		NEW INHERITANCE
		===============
		Check out the end-of-class notes on {EV_TITLED_WINDOW_ORGANIZED_INIT}.
		
		NOTEBOOKS
		=========
		Building the notebook: The notebook is built pretty much the same way as other GUI
		controls: A) Creation, B) Initialization. There is a small wrinkle in the mix. 
		
		Getting references to each "tab" in the notebook has to be done outside of the creation of
		the interface objects. Take special note of features like `button_tab' and see that
		it is a "self-creating" attribute. This means, it uses the "attribute" keyword and
		then provides its own creation based on the Result of a call to `notebook.item_tab'.
		
		In order to make this call, we must have both the `notebook' and the `button_box'
		objects created first (e.g. in `create_interface_objects'). Once they are created, then
		we can make a call to `button_tab' and use it. This we do in `initialize' in order
		to set the "text" on the tab and make it visible in the GUI window.
		
		BUTTONS
		=======
		
		Coming ...
		
		GAUGES
		======
		
		Coming ...
		
		LABELS
		======
		
		Coming ...
		
		LISTS
		=====
		
		Coming ...
		
		PIXMAPS
		=======
		
		Coming ...
		
		TEXT_COMPONENTS
		===============
		
		Coming ...
		
		TREEVIEWS
		=========
		
		Coming ...

		]"
	inheritance: "[
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
