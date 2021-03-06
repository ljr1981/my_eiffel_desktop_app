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
			testing:  "covers/{JSON_HANDLER}.string_to_object",
						"execution/isolated"
			EIS: "name=json_small_file", "src=$(system_path)\person.json"
		local
			l_handler: JSON_HANDLER
			l_person: PERSON
			l_json: STRING
			l_file: PLAIN_TEXT_FILE
		do
			create l_handler
			create l_person
			l_person.set_id (1)
			l_person.set_first_name ("Laurice")
			l_person.set_last_name ("Gilley")
			l_person.set_email ("lgilley0@ca.gov")
			l_person.set_gender ("Genderfluid")
			l_person.set_ip_address ("160.143.175.200")

			l_json := l_handler.to_json_string (l_person, l_handler.serializer_ctx)
			assert_strings_equal ("person_json", person_json, l_json)

			create l_file.make_create_read_write ("person.json")
			l_file.put_string (l_json)
			l_file.close

			create l_person -- empty/blank new PERSON instance
			check has_person: attached {PERSON} l_handler.from_json_string (l_json, l_handler.deserializer_ctx, l_person.generating_type) as al_person then
				l_person := al_person
			end
			assert_equal ("id", 				1,					l_person.id)
			assert_strings_equal ("first_name", "Laurice", 			l_person.first_name)
			assert_strings_equal ("last_name", 	"Gilley", 			l_person.last_name)
			assert_strings_equal ("email", 		"lgilley0@ca.gov", 	l_person.email)
			assert_strings_equal ("gender", 	"Genderfluid", 		l_person.gender)
			assert_strings_equal ("ip_address", "160.143.175.200", 	l_person.ip_address)
		end

feature {NONE} -- Test Support

	person_json: STRING = "[
{"$TYPE":"PERSON","first_name":"Laurice","last_name":"Gilley","email":"lgilley0@ca.gov","gender":"Genderfluid","ip_address":"160.143.175.200","id":1}
]"

end


