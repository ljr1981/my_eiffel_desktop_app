note
	testing: "type/manual"
	ca_ignore: "CA022" 	-- Class 'JSON_HANDLER_TEST_SET' contains unreachable code
						--	that should be considered to be removed.
						--	REALITY: The structure of the code is okay.

class
	JSON_HANDLER_TEST_SET

inherit
	TEST_SET_SUPPORT

feature -- Test routines

	person_serialize_deserialize_test
			-- Test the serialization and deserialization of {PERSON}.
		note
			testing:
				"covers/{JSON_HANDLER}.default_create",
				"covers/{JSON_HANDLER}.Deserializer_ctx",
				"covers/{JSON_HANDLER}.from_json_string",
				"covers/{JSON_HANDLER}.Serializer_ctx",
				"covers/{JSON_HANDLER}.to_json_string",
				"execution/isolated"
			EIS: "name=json_small_file", "src=$(system_path)\person.json"
		local
			l_handler: JSON_HANDLER
			l_person: PERSON
			l_json: STRING
			l_file: PLAIN_TEXT_FILE
		do
				-- Start with our JSON_HANDLER
			create l_handler
			l_handler.converter.set_compact_printing

				-- Create a PERSON to use for Serialization
			create l_person
			l_person.set_id (1)
			l_person.set_first_name ("Laurice")
			l_person.set_last_name ("Gilley")
			l_person.set_email ("lgilley0@ca.gov")
			l_person.set_gender ("Genderfluid")
			l_person.set_ip_address ("160.143.175.200")

				-- Turn PERSON into JSON
			l_json := l_handler.converter.to_json_string (l_person)

				-- Ensure we got what we expect.
			assert_strings_equal ("person_json", person_json, l_json)

				-- Save this to a file, so we can inspect it (see EIS link above).
			create l_file.make_create_read_write ("person.json")
			l_file.put_string (l_json)
			l_file.close

				-- Deserialize JSON back to PERSON
			create l_person -- empty/blank new PERSON instance
			check has_person: attached {PERSON} l_handler.converter.from_json_string (l_json, {PERSON}) as al_person then
				l_person := al_person
			end

				-- Now, test that our Deserialization worked
				--	and we have our PERSON back ...
			assert_equal ("id", 				1,					l_person.id)
			assert_strings_equal ("first_name", "Laurice", 			l_person.first_name)
			assert_strings_equal ("last_name", 	"Gilley", 			l_person.last_name)
			assert_strings_equal ("email", 		"lgilley0@ca.gov", 	l_person.email)
			assert_strings_equal ("gender", 	"Genderfluid", 		l_person.gender)
			assert_strings_equal ("ip_address", "160.143.175.200", 	l_person.ip_address)
		end

	complex_object_graph_test
				-- Test if doing complex object graphs is just as simple.
		note
			testing:
				"covers/{JSON_HANDLER}.default_create",
				"covers/{JSON_HANDLER}.Deserializer_ctx",
				"covers/{JSON_HANDLER}.from_json_string",
				"covers/{JSON_HANDLER}.Serializer_ctx",
				"covers/{JSON_HANDLER}.to_json_string",
				"execution/isolated"
			EIS: "name=json_small_file", "src=$(system_path)\person_with_address.json"
		local
			l_handler: JSON_HANDLER
			l_person: PERSON_WITH_ADDRESS
			l_json: STRING
			l_file: PLAIN_TEXT_FILE
		do
				-- Start with our JSON_HANDLER
			create l_handler
			l_handler.converter.set_compact_printing

				-- Create a PERSON_WITH_ADDRESS to use for Serialization
			create l_person
			l_person.set_id (1)
			l_person.set_first_name ("Laurice")
			l_person.set_last_name ("Gilley")
			l_person.set_email ("lgilley0@ca.gov")
			l_person.set_gender ("Genderfluid")
			l_person.set_ip_address ("160.143.175.200")
			l_person.set_address (create {ADDRESS}.make_from_data ("123 MY STREET", "APT 202", "SOME_CITY", "CA", "90122-1234"))

				-- Turn PERSON into JSON
			l_json := l_handler.converter.to_json_string (l_person)

				-- Ensure we got what we expect.
			assert_strings_equal ("person_with_address_json", person_with_address_json, l_json)

				-- Save this to a file, so we can inspect it (see EIS link above).
			create l_file.make_create_read_write ("person_with_address.json")
			l_file.put_string (l_json)
			l_file.close

				-- Deserialize JSON back to PERSON_WITH_ADDRESS
			create l_person -- empty/blank new PERSON_WITH_ADDRESS instance
			check has_person: attached {PERSON_WITH_ADDRESS} l_handler.converter.from_json_string (l_json, {PERSON_WITH_ADDRESS}) as al_person then
				l_person := al_person
			end

				-- Now, test that our Deserialization worked
				--	and we have our PERSON_WITH_ADDRESS back ...
			assert_equal ("id", 				1,					l_person.id)
			assert_strings_equal ("first_name", "Laurice", 			l_person.first_name)
			assert_strings_equal ("last_name", 	"Gilley", 			l_person.last_name)
			assert_strings_equal ("email", 		"lgilley0@ca.gov", 	l_person.email)
			assert_strings_equal ("gender", 	"Genderfluid", 		l_person.gender)
			assert_strings_equal ("ip_address", "160.143.175.200", 	l_person.ip_address)

			check has_address: attached {ADDRESS} l_person.address as al_address then
				assert_strings_equal ("street_line", 	"123 MY STREET", 	al_address.street_line)
				assert_strings_equal ("aux_line", 		"APT 202", 			al_address.aux_line)
				assert_strings_equal ("city", 			"SOME_CITY", 		al_address.city)
				assert_strings_equal ("state", 			"CA", 				al_address.state)
				assert_strings_equal ("zip_plus_4", 	"90122-1234", 		al_address.zip_plus_4)
			end

		end

feature {NONE} -- Test Support

	person_json: STRING = "[
{"$TYPE":"PERSON","first_name":"Laurice","last_name":"Gilley","email":"lgilley0@ca.gov","gender":"Genderfluid","ip_address":"160.143.175.200","id":1}
]"

	person_with_address_json: STRING = "[
{"$TYPE":"PERSON_WITH_ADDRESS","first_name":"Laurice","last_name":"Gilley","email":"lgilley0@ca.gov","gender":"Genderfluid","ip_address":"160.143.175.200","address":{"$TYPE":"ADDRESS","street_line":"123 MY STREET","aux_line":"APT 202","city":"SOME_CITY","state":"CA","zip_plus_4":"90122-1234"},"id":1}
]"

end


