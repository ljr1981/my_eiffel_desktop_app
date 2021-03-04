note
	description: "A specialized version of {EV_TITLED_WINDOW} with better initialization organization."
	ca_ignore: "CA022" 	-- Class 'EV_TITLED_WINDOW_ORGANIZED_INIT' contains unreachable code
						--	that should be considered to be removed.
						--	REALITY: The structure of the code is okay.

deferred class
	EV_TITLED_WINDOW_ORGANIZED_INIT

inherit
	EV_TITLED_WINDOW
		redefine
			initialize
		end

feature {NONE} -- Initialization

	initialize
			--<Precursor>
		do
			init_extend_containerships
			init_set_text_content
			init_text_formatting
			init_colorization
			init_sizing
			init_padding_and_border
			init_pixmaps
			init_gui_object_events
			init_disabling_of_item_expands
			Precursor
		end

feature {NONE} -- Initialization: Helpers

	init_extend_containerships
			-- Initialize GUI element containership extending.
		deferred
		end

	init_set_text_content
			-- Initialize GUI element text contents.
		deferred
		end

	init_text_formatting
			-- Initialize GUI element text formatting.
		deferred
		end

	init_colorization
			-- Initialize GUI element colorizing.
		deferred
		end

	init_sizing
			-- Initialize GUI element sizing.
		deferred
		end

	init_padding_and_border
			-- Initialize GUI container padding and border
		deferred
		end

	set_padding_and_border (a_widget: EV_BOX)
			-- Initialize padding and border sizing for `a_widget'.
		do
			a_widget.set_padding (default_padding_and_border)
			a_widget.set_border_width (default_padding_and_border)
		end

	default_padding_and_border: INTEGER
			--
		deferred
		end

	init_pixmaps
			-- Initializes GUI object pixmaps.
		deferred
		end

	init_gui_object_events
			-- Initialize GUI object events.
		deferred
		end

	init_disabling_of_item_expands
			-- Initialize disable of item expanding.
		deferred
		end

	disbale_item_expanding (a_parent: EV_BOX; a_child: EV_WIDGET)
			-- Handle disable of item expand of `a_child' in `a_parent'.
		require
			has_child: a_child.has_parent and then attached a_child.parent as al_parent and then al_parent ~ a_parent
		do
			a_parent.disable_item_expand (a_child)
		end

note
	design: "[
		Regretfully, the stock {EV_TITLED_WINDOW} does not do a very good job of
		helping you get organized around the matter of initializing the window.
		
		This class now extends or specializes the plain-ole {EV_TITLED_WINDOW} to
		include some organizational features and give you places to put certain code.
		
		Widgets are all about the following:
		
		1. Containership (who gets extended into whom)
		2. Text content (like text on buttons and labels)
		3. Text formatting (like fonts and so on)
		4. Colorizing of GUI elements
		5. Sizing of GUI elements
		6. Padding and Borders of {EV_BOX} widgets
		7. Pixmap setting
		8. Init-ing of GUI object event handlers
		9. Disabling of default-item expanding

		]"

end
