note
	testing: "type/manual"

class
	CSV_HANDLER_TEST_SET

inherit
	TEST_SET_SUPPORT

feature -- Test routines

	read_from_data_test
			-- Test the CSV_HANDLER.read_from_data routine.
		note
			testing:  "covers/{CSV_HANDLER}.read_from_data",
					"execution/isolated"
			design: "[
				This test exercises the heart of the CSV handler. The synopsis is:
				
				create l_csv				-- Creates an instance of CSV_HANDLER in l_csv
				l_csv.read_from_data (...)	-- See csv_1 and csv_2 STRINGs below
				
				We then do an attachment check on l_csv.last_read_data. Why?
				The reading of data may or may not be successful, because we are
				depending on an outside data-source that might be malformed. If
				the read fails for some reason, then the l_csv.last_read_data will
				be void (e.g. detached). So, we do the attachment test to ensure
				we have data. This is found in line #37 (below). Now, we can read (e.g. al_data [x, y])
				]"
		local
			l_csv: CSV_HANDLER
		do
			create l_csv
			l_csv.read_from_data (csv_1.split ('%N'))

				-- Nice and even column counts!
			check has_data: attached l_csv.last_read_data as al_data then
				assert_strings_equal ("1_1", "this", al_data [1, 1])
				assert_strings_equal ("2_2", "than", al_data [2, 2])
				assert_strings_equal ("3_3", "this", al_data [3, 3])
			end

				-- Can we break it with haphazard column counts?
			l_csv.read_from_data (csv_2.split ('%N'))

			check has_data_2: attached l_csv.last_read_data as al_data then
				assert_strings_equal ("1_1", "this", al_data [1, 1])
				assert_strings_equal ("2_2", "than", al_data [2, 2])
				assert_strings_equal ("2_5", "else", al_data [2, 5])
				assert_strings_equal ("2_6", "those", al_data [2, 6])
				assert_strings_equal ("3_3", "this", al_data [3, 3])
			end
		end

feature {NONE} -- Test Support

	csv_1: STRING = "[
this,that,other
more,than,that
and,finally,this
]"

	csv_2: STRING = "[
this,that,other
more,than,that,and,else,those
and,finally,this
]"

note
	design: "[
		As with all testing, the idea is to first prove that it works and then
		to prove we cannot think of a way to break it! The test above shows 
		both of these in a single test. We could split this into two tests,
		which might be a good idea.
		]"

end


