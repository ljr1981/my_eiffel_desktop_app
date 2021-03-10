note
	goal: "Demonstration of reading/writing JSON using JSON lib facilities."
	ca_ignore: "CA022" 	-- Class 'APPLICATION' contains unreachable code
						--	that should be considered to be removed.
						--	REALITY: The structure of the code is okay.

class
	JSON_HANDLER

feature -- Contexts

	converter: JSON_SERIALIZATION
			-- Serialization/Deserialization converter.
		once
			Result := (create {JSON_SERIALIZATION_FACTORY}).smart_serialization
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

note
	design: "[
		The JSON_HANDLER is a serializer and deserializer by way of
		the `converter' feature (see inherit above).
		
		The `converter' feature includes a complex in-line agent. What is the purpose of this
		agent?
		
		Serialization is a relatively simple process. Eiffel objects boil down (are serializable)
		to the basic JSON-primitives (see inheritance for JSON_VALUE). However, when it comes
		time for Deserialization, the process is not so straight forward!
		
		Deserialization has two needs:
		
		1. The system has to have a class matching the TYPE-ref in the JSON structure.
		2. The system has to know how to create a reasonable-default of each object.
		
		In the examle code (above) we need to teach our deserializer how to create
		reasonable-default instances of {PERSON}, {PERSON_WITH_ADDRESS}, and {ADDRESS}.
		We also teach it how to create instances of {ARRAYED_LIST [PERSON]} and even
		{DATE_TIME}. The most interesting of these is the {DATE_TIME} class.
		
		The {DATE_TIME} class has no `default_create', but a number of `make_*' creators (e.g. constructors).
		What is essentially happening is that the code in the in-line agent is providing a
		reasonable-default object instance of a TYPE that is then used as a template for making
		a new instance and populating it with data from the JSON-string stream.
		
		Therefore--if you find that your code is refusing to deserialize and reconstitute a reference
		type object from the JSON-string streaming in--then--you need to think about adding
		that class as a created-object-instance to the in-line agent (above). Having this instance
		will give the JSON-library what it needs to make new instances of your specialized class
		from the {TYPE} of your class.
		]"

end
