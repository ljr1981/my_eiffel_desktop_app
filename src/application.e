note
	goal: "[
		Demonstrate how to coordinate the EV_APPLICATION with EV_TITLED_WINDOW 
		to form a working desktop application.
		]"
	EIS: "name=posted_CA022_issue_to_Eiffel_google_groups",
			"src=https://groups.google.com/g/eiffel-users/c/whDZWeeHKMg"
	ca_ignore: "CA022" 	-- Class 'APPLICATION' contains unreachable code
						--	that should be considered to be removed.
						--	REALITY: The structure of the code is okay.

class
	APPLICATION

create
	make

feature {NONE}  -- Initialization

	make
			-- Run application.
		do
			create application
			create main_window.make

			main_window.close_request_actions.extend (agent application.destroy)
			application.post_launch_actions.extend (agent main_window.show)

			application.launch
		end

feature {NONE} -- Implementation

	application: EV_APPLICATION
			-- Primary `application' (event loop).

	main_window: MAIN_WINDOW;
			-- The `application' `main_window'.

note
	design: "[
		The core class for an Eiffel desktop application involves two essential classes.
		Lines #29 and #32 represent these classes.
		
		The EV_APPLICATION class is the core event loop, which watches for user-based
		events (like keystrokes, mouse-movements, clicks, and so on).
		
		The MAIN_WINDOW is based on EV_TITLED_WINDOW, which is the primary windowing
		class in Eiffel Vision2.
		
		In the code above, we have several chores being handled:
		
		1. The creation of both application and main_window.
		2. Telling application to destroy when main_window gets a close_request_actions call.
		3. Telling application to launch main_window when it finishes setting itself up.
		4. Starting the application main event-loop once the above steps are finished.
		
		Note that the setup of main_window is being handled in the MAIN_WINDOW class itself.
		Such setup could be accomplished from this class as well. So, doing the window
		setup in MAIN_WINDOW is a design-choice and not a requirement.
		]"
	lets_talk_about_agents: "[
		In lines #21 and #22, you will see the "agent" keyword. What is this doing?
		Agents are Eiffel's Lambda-functions. It allows you to turn a method (routine)
		of a class into an object that can be stored and later called or even passed
		around (e.g. like a call-back or other use-cases). There are two primary types
		of agents: PROCEDURE and FUNCTION. Yes, in Eiffel these are based on classes.
		They are not "compiler-magic". You can look up these classes and explore them
		in the Class Context tool (see below and left for the "Class" tab in the Context
		Tool panel).
		]"
	see_line_32_above: "[
		The semi-colon at the end of line #32 prevents a nuisance compiler syntax-error.
		The only time I have ever found the compiler to be unable to resolve its parsing
		task is when a "property" (attribute) feature is the last-thing before the
		end-of-class "end" keyword. In this case, one has two choices: A) put a semi-colon
		(as above) or B) use the "attribute ... end" structure to create a self-initializing
		attribute (property). Essentially, you're giving the Eiffel compiler
		"something-to-look-at" so it can properly parse. Why this has not been handled in
		the compiler as a known-use-case is beyond me. So, there you have it.
		]"

end
