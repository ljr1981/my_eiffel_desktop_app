note
	goal: "Demonstrate an ADDRESS for use in complex object-graphs."
	ca_ignore: "CA011" -- The number of args is okay with me.
	
class
	ADDRESS

create
	default_create,
	make_from_data

feature {NONE} -- Initialization

	make_from_data (a_street, a_aux, a_city, a_state, a_zip: STRING)
			--
		do
			street_line := a_street
			aux_line := a_aux
			city := a_city
			state := a_state
			zip_plus_4 := a_zip
		end

feature -- Access

	street_line: STRING 	assign set_street_line 	attribute create Result.make_empty end
	aux_line: STRING 		assign set_aux_line 	attribute create Result.make_empty end
	city: STRING 			assign set_city 		attribute create Result.make_empty end
	state: STRING 			assign set_state		attribute create Result.make_empty end
	zip_plus_4: STRING 		assign set_zip_plus_4 	attribute create Result.make_empty end

feature -- Settings

	set_street_line (s: STRING) do street_line := s end
	set_aux_line 	(s: STRING) do aux_line := s end
	set_city 		(s: STRING) do city := s end
	set_state 		(s: STRING) do state := s end
	set_zip_plus_4 	(s: STRING) do zip_plus_4 := s end

end
