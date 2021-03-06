note
	goal: "Demonstration of a JSON-enabled Eiffel Object."

class
	PERSON

feature -- Access

	id: INTEGER

	first_name,
	last_name,
	email,
	gender,
	ip_address: STRING
		attribute
			create Result.make_empty
		end

feature -- Settings

	set_id (a_id: like id)
			--
		do
			id := a_id
		ensure
			set: id = a_id
		end

	set_first_name (a_value: like first_name)
			--
		do
			first_name := a_value
		ensure
			set: first_name.same_string (a_value)
		end

	set_last_name (a_value: like last_name)
			--
		do
			last_name := a_value
		ensure
			set:  last_name.same_string (a_value)
		end

	set_email (a_value: like email)
			--
		do
			email := a_value
		ensure
			set:  email.same_string (a_value)
		end

	set_gender (a_value: like gender)
			--
		do
			gender := a_value
		ensure
			set:  gender.same_string (a_value)
		end

	set_ip_address (a_value: like ip_address)
			--
		do
			ip_address := a_value
		ensure
			set:  ip_address.same_string (a_value)
		end

note
	design: "[
		Fields:
		
		  "id": 1,
		  "first_name": "Laurice",
		  "last_name": "Gilley",
		  "email": "lgilley0@ca.gov",
		  "gender": "Genderfluid",
		  "ip_address": "160.143.175.200"

		]"

end
