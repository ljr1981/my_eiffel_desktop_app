note
	goal: "Demonstrate reading, parsing, writing CSV data."

class
	CSV_HANDLER

inherit
	ANY
		redefine
			out
		end

feature -- Access

	last_data: detachable ARRAY2 [STRING]
			-- Data that has been parsed into rows/cols.

	last_data_attached: attached like last_data
			-- The attached version.
		do
			check has_data: attached last_data as al_result then
				Result := al_result
			end
		end

	last_row_col_counts: like rows_cols_tuple_anchor
			-- What was the last max row/col count of `last_data'?
		do
			if attached last_data as al_data then
				Result := [al_data.height, al_data.width]
			end
		end

	last_read_raw: detachable LIST [STRING]
			-- Data that has been parsed into rows with raw-cols (not split).

feature -- Basic Operations

	read_from_filename (a_file_name: STRING)
			-- Read CSV from `a_file_name' to `last_data'
		do
			read_from_path (create {PATH}.make_from_string (a_file_name))
		end

	read_from_path (a_path: PATH)
			-- Read CSV from `a_path'
			-- Data (if any) ends up in `last_data'.
		local
			l_file: PLAIN_TEXT_FILE
		do
			create l_file.make_with_path (a_path)
			if l_file.exists then
				create l_file.make_open_read (a_path.name.out)
				l_file.read_stream (l_file.count)
				l_file.close
				last_read_raw := l_file.last_string.split (new_line)
				if attached last_read_raw as al_raw then
					read_from_data (al_raw)
				end
			end
		end

	read_from_data (a_data: attached like last_read_raw)
			-- Read `a_data' into `last_data'
		local
			l_data: attached like last_data
			l_rows_cols: attached like rows_cols_tuple_anchor
		do
			last_data := Void -- Be sure to wipe out prior read-results.
			if attached a_data as al_raw then
					-- Get row/col count
				l_rows_cols := row_max_col_counts (al_raw)
					-- Load l_data ...
				create l_data.make_filled (Empty_string, l_rows_cols.rows, l_rows_cols.max_cols)
				across al_raw as ic loop
					across ic.item.split (comma_char) as ic_items loop
						l_data.put (ic_items.item, ic.cursor_index, ic_items.cursor_index)
					end
				end
				last_data := l_data
			end
		ensure
			valid_row_count: last_data_attached.height = a_data.count
		end

feature -- Outputs

	out: STRING
			--<Precursor>
		do
			create Result.make_empty
			if attached last_data as al_data and then
				not al_data.is_empty
			then
				across
					1 |..| al_data.height as i
				loop
					across
						1 |..| al_data.width as j
					loop
						if
							attached al_data [i.item, j.item] as al_data_item and then
							not al_data_item.is_empty
						then
							Result.append_string_general (al_data [i.item, j.item])
							Result.append_character (Comma_char)
						end
					end
					if Result [Result.count] = Comma_char then
						Result.remove_tail (1)
					end
					Result.append_character (New_line)
				end
				if Result [Result.count] = New_line then
					Result.remove_tail (1)
				end
			end

		end

	out_to_file (a_path: PATH)
			-- Send `out' to file at `a_path'.
		local
			l_file: PLAIN_TEXT_FILE
		do
			create l_file.make_create_read_write (a_path.name.out)
			l_file.put_string (out)
			l_file.close
		ensure
			has_file: attached (create {PLAIN_TEXT_FILE}.make_with_path (a_path)) as al_file and then
						al_file.exists
		end

feature {NONE} -- Implementation

	row_max_col_counts (a_data: attached like last_read_raw): attached like rows_cols_tuple_anchor
			-- Compute max rows/cols for `a_data'.
		local
			l_rows,
			l_max_cols: INTEGER
		do
			if attached a_data as al_raw then
					-- Get row/col count
				l_rows := al_raw.count
				across al_raw as ic loop
					if attached ic.item.split (comma_char).count as al_cols and then al_cols > l_max_cols then
						l_max_cols := al_cols
					end
				end
			end
			Result := [l_rows, l_max_cols]
		ensure
			has_result: attached a_data implies attached Result
		end

	rows_cols_tuple_anchor: detachable TUPLE [rows, max_cols: INTEGER];
			-- Type anchor for max rows/cols counts.

feature {TEST_SET_BRIDGE} -- Implementation: Constants

	new_line: CHARACTER = '%N'
			-- Represents new-line as named constant.

	comma_char: CHARACTER = ','
			-- Represents comma as named constant.

	space_char: CHARACTER = ' '
			-- Represents space char as named constant.

	space: STRING = " "
			-- Represents space string as named constant.

	empty_string: STRING = ""

invariant
	valid_counts: not attached last_data xor
					(attached last_data as al_data and then
						attached last_row_col_counts as al_counts and then
						al_counts.rows = al_data.height and then
						al_counts.max_cols = al_data.width)

end
