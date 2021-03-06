note
	goal: "Demonstration of reading/writing JSON using JSON lib facilities."
	ca_ignore: "CA022" 	-- Class 'APPLICATION' contains unreachable code
						--	that should be considered to be removed.
						--	REALITY: The structure of the code is okay.

class
	JSON_HANDLER

inherit
	JSON_REFLECTOR_SERIALIZER
		redefine
			reset
		end

	JSON_REFLECTOR_DESERIALIZER
		redefine
			reset
		end

feature -- Contexts

	serializer_ctx: JSON_SERIALIZER_CONTEXT
			-- A general serializer context for Current.
		once
			create Result
		end

	deserializer_ctx: JSON_DESERIALIZER_CONTEXT
			-- A general deserializer context for Current.
		once
			create Result
		end

feature -- Cleaning

	reset
			-- <Precursor>
		do
			fields_infos_by_type_id := Void
		end

note
	design: "[
		The JSON_HANDLER is a serializer and deserializer by way of
		inheritance (see inherit above).
		]"

end
