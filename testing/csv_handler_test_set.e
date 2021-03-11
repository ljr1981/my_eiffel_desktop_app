note
	testing: "type/manual"
	ca_ignore: "CA022" 	-- Class 'APPLICATION' contains unreachable code
						--	that should be considered to be removed.
						--	REALITY: The structure of the code is okay.

class
	CSV_HANDLER_TEST_SET

inherit
	TEST_SET_SUPPORT

feature -- Test routines

	the_value_of_print_test
			-- Do we need "print"?
		note
			testing: "covers/{STRING_8}.plus"
		local
			fn,mn,ln,suffix: STRING
		do
<<<<<<< HEAD
			fn := "Larry "
			mn := "J. "
			ln := "Rix, "
=======
			fn := "Larry"
			mn := "J."
			ln := "Rix"
>>>>>>> 315bf0c1c0e442942860d52e4b4503cc7c2238e6
			suffix := "Jr."

			print (fn); print (mn); print (ln); print (suffix)

			assert_strings_equal ("sample_test_tag", "Larry J. Rix, Jr.", fn + " " + mn + " " + ln + ", " + suffix)
		end

	read_from_data_test
			-- Test the CSV_HANDLER.read_from_data routine.
		note
			testing:  "covers/{ARRAY2}.item",
						"covers/{CHARACTER_8}.to_character_32",
						"covers/{CSV_HANDLER}.default_create",
						"covers/{CSV_HANDLER}.last_data",
						"covers/{CSV_HANDLER}.last_row_col_counts",
						"covers/{CSV_HANDLER}.New_line",
						"covers/{CSV_HANDLER}.read_from_data",
						"covers/{STRING_8}.split"
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
				-- Empty input stream ...
			create l_csv
			l_csv.read_from_data (("").split ({CSV_HANDLER}.new_line))

				-- Add some data ...
			l_csv.read_from_data (csv_1.split ({CSV_HANDLER}.new_line))
			check has_data: attached l_csv.last_data as al_data then
				assert_equal ("row_col_1", [3, 3], l_csv.last_row_col_counts)
				assert_strings_equal ("1_1", "this", al_data [1, 1])
				assert_strings_equal ("2_2", "than", al_data [2, 2])
				assert_strings_equal ("3_3", "this", al_data [3, 3])
			end

				-- Can we break it with haphazard column counts?
			l_csv.read_from_data (csv_2.split ({CSV_HANDLER}.new_line))
			check has_data_2: attached l_csv.last_data as al_data then
				assert_equal ("row_col_2", [3, 6], l_csv.last_row_col_counts)
				assert_strings_equal ("1_1", "this", al_data [1, 1])
				assert_strings_equal ("2_2", "than", al_data [2, 2])
				assert_strings_equal ("2_5", "else", al_data [2, 5])
				assert_strings_equal ("2_6", "those", al_data [2, 6])
				assert_strings_equal ("3_3", "this", al_data [3, 3])
			end
		end

	outputs_test
			-- Test outputs
		note
			testing:  "covers/{CHARACTER_8}.to_character_32",
						"covers/{CSV_HANDLER}.default_create",
						"covers/{CSV_HANDLER}.New_line",
						"covers/{CSV_HANDLER}.out",
						"covers/{CSV_HANDLER}.out_to_file",
						"covers/{CSV_HANDLER}.read_from_data",
						"covers/{CSV_HANDLER}.read_from_filename",
						"covers/{PATH}.make_from_string",
						"covers/{STRING_8}.split"
			EIS: "name=csv_1.txt", "src=$(system_path)\csv_1.txt"
			EIS: "name=csv_2.txt", "src=$(system_path)\csv_2.txt"
		local
			l_csv: CSV_HANDLER
		do
			create l_csv
			l_csv.read_from_data (csv_1.split ({CSV_HANDLER}.new_line))			-- From data 1
			assert_strings_equal ("outs_match_1", csv_1, l_csv.out)				-- Should match out
			l_csv.out_to_file (create {PATH}.make_from_string ("csv_1.txt"))	-- Save to file
			l_csv.read_from_filename ("csv_1.txt")								-- Read that file
			assert_strings_equal ("outs_match_1b", csv_1, l_csv.out)			-- Should match out

			l_csv.read_from_data (csv_2.split ({CSV_HANDLER}.new_line))			-- From data 2
			assert_strings_equal ("outs_match_2", csv_2, l_csv.out)				-- Should match out
			l_csv.out_to_file (create {PATH}.make_from_string ("csv_2.txt"))	-- Save to file
			l_csv.read_from_filename ("csv_2.txt")								-- Read file
			assert_strings_equal ("outs_match_2b", csv_2, l_csv.out)			-- Should match out
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


