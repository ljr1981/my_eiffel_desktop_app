note
	goal: "Demonstration of reading/writing JSON using JSON lib facilities."

class
	JSON_HANDLER

feature -- Query Functions

	string_to_object (a_json: STRING): detachable JSON_OBJECT
			-- Parse `a_json' `string_to_object' (if any).
		local
			l_parser: JSON_PARSER
		do
			create l_parser.make_with_string (prep_json_string (a_json))
			l_parser.parse_content
			if attached l_parser.parsed_json_object as al_object then
				Result := al_object.twin
			end
		end

	number_value (a_object: detachable JSON_OBJECT; a_key: STRING): NUMERIC
			-- `number_value' for `a_key' in `a_object'
		do
			if
				attached a_object as al_object and then
				attached {JSON_NUMBER} al_object.item (json_string (a_key)) as al_item
			then
				--is_double: BOOLEAN
				--is_integer: BOOLEAN
				--is_natural: BOOLEAN
				--is_real: BOOLEAN

				if al_item.is_double then
					Result := al_item.double_item
				elseif al_item.is_integer then
					Result := al_item.integer_64_item
				elseif al_item.is_natural then
					Result := al_item.natural_64_item
				elseif al_item.is_real then
					Result := al_item.real_64_item.truncated_to_real
				else
					Result := 0
				end
			else
				Result := 0
			end
		end

	string_value (a_object: detachable JSON_OBJECT; a_key: STRING): STRING
			-- `string_value' for `a_key' in `a_object'
		do
			create Result.make_empty
			if
				attached a_object as al_object and then
				attached {JSON_STRING} al_object.item (json_string (a_key)) as al_item
			then
				Result := al_item.item
			end
		end

	boolean_value (a_object: detachable JSON_OBJECT; a_key: STRING): BOOLEAN
			-- `boolean_value' for `a_key' in `a_object'
		do
			create Result
			if
				attached a_object as al_object and then
				attached {JSON_BOOLEAN} al_object.item (json_string (a_key)) as al_item
			then
				Result := al_item.item
			end
		end

feature {NONE} -- Implementation

	json_string (a_string: STRING): JSON_STRING
			-- Convert `a_string' to JSON_STRING.
		do
			create Result.make_from_string (a_string)
		end

	prep_json_string (a_json: STRING): STRING
			-- Prepare `a_json' for parsing.
		do
			if a_json [a_json.count].is_control then
				from

				until
					not a_json [a_json.count].is_control
				loop
					a_json.remove_tail (1)
				end
			end
			if a_json [a_json.count] = ')' then
				a_json [a_json.count] := '}'
			end
			Result := a_json
		end

note
	design: "[
		The JSON library has these basic "values":
		
		JSON_VALUE
			JSON_ARRAY
			JSON_BOOLEAN
			JSON_NULL
			JSON_NUMBER
			JSON_OBJECT
			JSON_STRING
			
		JSON_OBJECTs and JSON_ARRAYs can be populated by JSON_VALUE items. So, the trick
		is to be able to easily walk a JSON-structure, culling out each level of data to
		place it properly in some receiving object. This process is nested because the
		object-graphs can be nested as well.
		]"

end
