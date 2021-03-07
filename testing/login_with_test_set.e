note
	testing: "type/manual"

class
	LOGIN_WITH_TEST_SET

inherit
	TEST_SET_SUPPORT

feature -- Test routines

	login_with_test
			-- github
		note
			testing:  "execution/isolated"
		local
			l_github: OAUTH_20_GITHUB_API
		do
			create l_github
		end

end


