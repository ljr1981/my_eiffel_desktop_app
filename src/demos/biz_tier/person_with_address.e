note
	goal: "Demonstrate a complex object-graph with JSON."

class
	PERSON_WITH_ADDRESS

inherit
	PERSON

feature -- Access

	address: detachable ADDRESS;
			-- The `address' of Current (if any).

feature -- Settings

	set_address (a_address: like address)
			--
		do
			address := a_address
		ensure
			set: address ~ a_address
		end

end
