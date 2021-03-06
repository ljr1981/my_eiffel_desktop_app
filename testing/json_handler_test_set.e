note
	testing: "type/manual"

class
	JSON_HANDLER_TEST_SET

inherit
	TEST_SET_SUPPORT

feature -- Test routines

	json_serialization_deserialization_test
			-- New test routine
		note
			testing:  "covers/{JSON_HANDLER}.string_to_object",
						"execution/isolated"
			EIS: "name=json_small_file", "src=$(system_path)\json_small.json"
		local
			l_handler: JSON_HANDLER
			l_object: detachable JSON_OBJECT
			l_file: PLAIN_TEXT_FILE
		do
			create l_handler
			l_object := l_handler.string_to_object (json_small)

			if attached l_object then
				assert_equal ("id", 				{INTEGER_64} 1, 	l_handler.number_value (l_object, "id"))
				assert_strings_equal ("first_name", "Laurice", 			l_handler.string_value (l_object, "first_name"))
				assert_strings_equal ("last_name", 	"Gilley", 			l_handler.string_value (l_object, "last_name"))
				assert_strings_equal ("email", 		"lgilley0@ca.gov", 	l_handler.string_value (l_object, "email"))
				assert_strings_equal ("gender", 	"Genderfluid", 		l_handler.string_value (l_object, "gender"))
				assert_strings_equal ("ip_address", "160.143.175.200", 	l_handler.string_value (l_object, "ip_address"))

					-- Serialization of JSON_OBJECT --> File
				create l_file.make_create_read_write ("json_small.json")
				l_file.put_string (l_object.representation)
				l_file.close
			end

				-- Now, read back that file and Deserialize the contents.
			create l_file.make_open_read ("json_small.json")
			l_file.read_stream (l_file.count)
			l_file.close

				-- We ought to have the same data.			
			l_object := l_handler.string_to_object (l_file.last_string)
			if attached l_object then
				assert_equal ("id", 				{INTEGER_64} 1, 	l_handler.number_value (l_object, "id"))
				assert_strings_equal ("first_name", "Laurice", 			l_handler.string_value (l_object, "first_name"))
				assert_strings_equal ("last_name", 	"Gilley", 			l_handler.string_value (l_object, "last_name"))
				assert_strings_equal ("email", 		"lgilley0@ca.gov", 	l_handler.string_value (l_object, "email"))
				assert_strings_equal ("gender", 	"Genderfluid", 		l_handler.string_value (l_object, "gender"))
				assert_strings_equal ("ip_address", "160.143.175.200", 	l_handler.string_value (l_object, "ip_address"))
			end
		end

feature {NONE} -- Test Support

	json_small: STRING = "[
{
  "id": 1,
  "first_name": "Laurice",
  "last_name": "Gilley",
  "email": "lgilley0@ca.gov",
  "gender": "Genderfluid",
  "ip_address": "160.143.175.200"
}
]"

end


