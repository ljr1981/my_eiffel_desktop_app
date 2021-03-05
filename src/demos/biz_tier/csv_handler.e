note
	goal: "Demonstrate reading, parsing, writing CSV data."

class
	CSV_HANDLER

feature -- Access

	last_read_data: detachable ARRAY2 [STRING]
			-- Data that has been parsed into rows/cols.

	last_read_raw: detachable LIST [STRING]
			-- Data that has been parsed into rows with raw-cols (not split).

feature -- Basic Operations

	read_from_filename (a_file_name: STRING)
			--
		do
			read_from_path (create {PATH}.make_from_string (a_file_name))
		end

	read_from_path (a_path: PATH)
			-- Read CSV from `a_path'
			-- Data (if any) ends up in `last_read_data'.
		local
			l_file: PLAIN_TEXT_FILE
		do
			create l_file.make_with_path (a_path)
			if l_file.exists then
				create l_file.make_open_read (a_path.name.out)
				l_file.read_stream (l_file.count)
				l_file.close
				last_read_raw := l_file.last_string.split ('%N')
				if attached last_read_raw as al_raw then
					read_from_data (al_raw)
				end
			end
		end

	read_from_data (a_data: attached like last_read_raw)
			-- Read `a_data' into `last_read_data'
		local
			l_data: attached like last_read_data
			l_rows_cols: attached like rows_cols_tuple_anchor
		do
			if attached a_data as al_raw then
					-- Get row/col count
				l_rows_cols := row_max_col_counts (al_raw)
					-- Load l_data ...
				create l_data.make_filled ("", l_rows_cols.rows, l_rows_cols.max_cols)
				across al_raw as ic loop
					across ic.item.split (',') as ic_items loop
						l_data.put (ic_items.item, ic.cursor_index, ic_items.cursor_index)
					end
				end
				last_read_data := l_data
			end
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
					if attached ic.item.split (',').count as al_cols and then al_cols > l_max_cols then
						l_max_cols := al_cols
					end
				end
			end
			Result := [l_rows, l_max_cols]
		end

	rows_cols_tuple_anchor: detachable TUPLE [rows, max_cols: INTEGER];
			-- Type anchor for max rows/cols counts.

end
