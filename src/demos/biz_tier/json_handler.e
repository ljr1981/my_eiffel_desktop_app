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

	json_converter: JSON_SERIALIZATION
			-- Serialization/Deserialization processor.
		local
			l_factory: JSON_SERIALIZATION_FACTORY
		once
			create l_factory
			Result := l_factory.smart_serialization
			Result.set_pretty_printing
			Result.context.deserializer_context.set_value_creation_callback (create {JSON_DESERIALIZER_CREATION_AGENT_CALLBACK}.make (
						agent (a_info: JSON_DESERIALIZER_CREATION_INFORMATION)
							do
								if a_info.static_type = {PERSON} then
									a_info.set_object (create {PERSON})
								elseif a_info.static_type = {PERSON_WITH_ADDRESS} then
									a_info.set_object (create {PERSON_WITH_ADDRESS})
								elseif a_info.static_type = {ADDRESS} then
									a_info.set_object (create {ADDRESS})
								elseif a_info.static_type = {ARRAYED_LIST [PERSON]} then
									a_info.set_object (create {ARRAYED_LIST [PERSON]}.make (0))
								elseif a_info.static_type = {DATE_TIME} then
									a_info.set_object (create {DATE_TIME}.make_now)
								end
							end
					)
				)
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
