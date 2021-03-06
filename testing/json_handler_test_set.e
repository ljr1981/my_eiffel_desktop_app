note
	testing: "type/manual"

class
	JSON_HANDLER_TEST_SET

inherit
	TEST_SET_SUPPORT

feature -- Test routines

	json_data_test
			-- New test routine
		note
			testing:  "covers/{JSON_HANDLER}.json_string_to_json_object",
						"execution/isolated"
		local
			l_handler: JSON_HANDLER
			l_object: detachable JSON_OBJECT
		do
			create l_handler
			l_object := l_handler.string_to_object (json_small)

			assert_equal ("id", 				{INTEGER_64} 1, 	l_handler.number_value (l_object, "id"))
			assert_strings_equal ("first_name", "Laurice", 			l_handler.string_value (l_object, "first_name"))
			assert_strings_equal ("last_name", 	"Gilley", 			l_handler.string_value (l_object, "last_name"))
			assert_strings_equal ("email", 		"lgilley0@ca.gov", 	l_handler.string_value (l_object, "email"))
			assert_strings_equal ("gender", 	"Genderfluid", 		l_handler.string_value (l_object, "gender"))
			assert_strings_equal ("ip_address", "160.143.175.200", 	l_handler.string_value (l_object, "ip_address"))
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

	json_big: STRING = "[
{[{
  "id": 1,
  "first_name": "Laurice",
  "last_name": "Gilley",
  "email": "lgilley0@ca.gov",
  "gender": "Genderfluid",
  "ip_address": "160.143.175.200"
}, {
  "id": 2,
  "first_name": "Terri",
  "last_name": "Aspole",
  "email": "taspole1@hao123.com",
  "gender": "Bigender",
  "ip_address": "74.110.129.170"
}, {
  "id": 3,
  "first_name": "Josy",
  "last_name": "Toffolo",
  "email": "jtoffolo2@weebly.com",
  "gender": "Genderfluid",
  "ip_address": "170.144.114.227"
}, {
  "id": 4,
  "first_name": "Juliann",
  "last_name": "Nutton",
  "email": "jnutton3@google.com.hk",
  "gender": "Polygender",
  "ip_address": "158.197.190.78"
}, {
  "id": 5,
  "first_name": "Ernesta",
  "last_name": "Labb",
  "email": "elabb4@sitemeter.com",
  "gender": "Non-binary",
  "ip_address": "246.125.164.156"
}, {
  "id": 6,
  "first_name": "Caroline",
  "last_name": "Errol",
  "email": "cerrol5@berkeley.edu",
  "gender": "Polygender",
  "ip_address": "156.18.114.63"
}, {
  "id": 7,
  "first_name": "Jenda",
  "last_name": "Kelcher",
  "email": "jkelcher6@youtube.com",
  "gender": "Bigender",
  "ip_address": "124.51.162.241"
}, {
  "id": 8,
  "first_name": "Randolf",
  "last_name": "Tivnan",
  "email": "rtivnan7@wisc.edu",
  "gender": "Polygender",
  "ip_address": "20.73.93.186"
}, {
  "id": 9,
  "first_name": "Kahaleel",
  "last_name": "Sleicht",
  "email": "ksleicht8@wufoo.com",
  "gender": "Genderqueer",
  "ip_address": "174.141.14.27"
}, {
  "id": 10,
  "first_name": "Cilka",
  "last_name": "De Gouy",
  "email": "cdegouy9@cdbaby.com",
  "gender": "Polygender",
  "ip_address": "66.138.236.147"
}, {
  "id": 11,
  "first_name": "Ferdie",
  "last_name": "Ellyatt",
  "email": "fellyatta@ehow.com",
  "gender": "Bigender",
  "ip_address": "201.98.248.92"
}, {
  "id": 12,
  "first_name": "Camila",
  "last_name": "Cornelleau",
  "email": "ccornelleaub@scientificamerican.com",
  "gender": "Polygender",
  "ip_address": "116.119.93.189"
}, {
  "id": 13,
  "first_name": "Powell",
  "last_name": "Brayfield",
  "email": "pbrayfieldc@wikipedia.org",
  "gender": "Genderqueer",
  "ip_address": "35.189.127.251"
}, {
  "id": 14,
  "first_name": "Elizabet",
  "last_name": "Hempshall",
  "email": "ehempshalld@dropbox.com",
  "gender": "Polygender",
  "ip_address": "205.192.102.139"
}, {
  "id": 15,
  "first_name": "Prince",
  "last_name": "Seville",
  "email": "psevillee@amazon.com",
  "gender": "Female",
  "ip_address": "21.105.60.122"
}, {
  "id": 16,
  "first_name": "Yevette",
  "last_name": "Robben",
  "email": "yrobbenf@vk.com",
  "gender": "Genderqueer",
  "ip_address": "80.116.175.117"
}, {
  "id": 17,
  "first_name": "Huntlee",
  "last_name": "Hewkin",
  "email": "hhewking@sfgate.com",
  "gender": "Agender",
  "ip_address": "122.98.167.23"
}, {
  "id": 18,
  "first_name": "Skipp",
  "last_name": "Skeene",
  "email": "sskeeneh@prweb.com",
  "gender": "Genderfluid",
  "ip_address": "95.231.160.25"
}, {
  "id": 19,
  "first_name": "Myrtle",
  "last_name": "Gouth",
  "email": "mgouthi@twitpic.com",
  "gender": "Male",
  "ip_address": "47.161.44.25"
}, {
  "id": 20,
  "first_name": "Alli",
  "last_name": "Collyns",
  "email": "acollynsj@epa.gov",
  "gender": "Agender",
  "ip_address": "43.239.139.77"
}, {
  "id": 21,
  "first_name": "Boote",
  "last_name": "Houdhury",
  "email": "bhoudhuryk@prnewswire.com",
  "gender": "Female",
  "ip_address": "104.28.3.113"
}, {
  "id": 22,
  "first_name": "Stanford",
  "last_name": "Putt",
  "email": "sputtl@wufoo.com",
  "gender": "Non-binary",
  "ip_address": "119.114.158.106"
}, {
  "id": 23,
  "first_name": "Vivyanne",
  "last_name": "Shard",
  "email": "vshardm@mashable.com",
  "gender": "Polygender",
  "ip_address": "178.189.165.78"
}, {
  "id": 24,
  "first_name": "Lelia",
  "last_name": "Crippell",
  "email": "lcrippelln@ovh.net",
  "gender": "Female",
  "ip_address": "189.141.85.138"
}, {
  "id": 25,
  "first_name": "Ollie",
  "last_name": "Pedroni",
  "email": "opedronio@reverbnation.com",
  "gender": "Non-binary",
  "ip_address": "240.93.4.70"
}, {
  "id": 26,
  "first_name": "Dyane",
  "last_name": "Hindenburg",
  "email": "dhindenburgp@microsoft.com",
  "gender": "Male",
  "ip_address": "102.231.235.44"
}, {
  "id": 27,
  "first_name": "Elfrieda",
  "last_name": "Hymus",
  "email": "ehymusq@arizona.edu",
  "gender": "Agender",
  "ip_address": "161.131.20.231"
}, {
  "id": 28,
  "first_name": "Nicolas",
  "last_name": "Valasek",
  "email": "nvalasekr@state.gov",
  "gender": "Genderqueer",
  "ip_address": "80.89.178.197"
}, {
  "id": 29,
  "first_name": "Harwell",
  "last_name": "Moulton",
  "email": "hmoultons@blinklist.com",
  "gender": "Female",
  "ip_address": "49.72.81.228"
}, {
  "id": 30,
  "first_name": "Ryley",
  "last_name": "Abriani",
  "email": "rabrianit@princeton.edu",
  "gender": "Male",
  "ip_address": "151.1.166.77"
}, {
  "id": 31,
  "first_name": "Sela",
  "last_name": "Annear",
  "email": "sannearu@ustream.tv",
  "gender": "Genderfluid",
  "ip_address": "227.242.87.90"
}, {
  "id": 32,
  "first_name": "Barbara",
  "last_name": "De Domenicis",
  "email": "bdedomenicisv@blogtalkradio.com",
  "gender": "Non-binary",
  "ip_address": "226.234.96.222"
}, {
  "id": 33,
  "first_name": "Vincent",
  "last_name": "Neising",
  "email": "vneisingw@stumbleupon.com",
  "gender": "Genderqueer",
  "ip_address": "31.128.31.168"
}, {
  "id": 34,
  "first_name": "Klarika",
  "last_name": "McTerrelly",
  "email": "kmcterrellyx@tinypic.com",
  "gender": "Agender",
  "ip_address": "62.165.99.105"
}, {
  "id": 35,
  "first_name": "Byrom",
  "last_name": "Linner",
  "email": "blinnery@symantec.com",
  "gender": "Non-binary",
  "ip_address": "14.2.244.67"
}, {
  "id": 36,
  "first_name": "Gill",
  "last_name": "Jillings",
  "email": "gjillingsz@opensource.org",
  "gender": "Bigender",
  "ip_address": "80.222.171.54"
}, {
  "id": 37,
  "first_name": "Audry",
  "last_name": "Saunder",
  "email": "asaunder10@addtoany.com",
  "gender": "Female",
  "ip_address": "157.119.24.57"
}, {
  "id": 38,
  "first_name": "Mycah",
  "last_name": "Clingan",
  "email": "mclingan11@epa.gov",
  "gender": "Non-binary",
  "ip_address": "221.231.177.104"
}, {
  "id": 39,
  "first_name": "Terrijo",
  "last_name": "Fairman",
  "email": "tfairman12@wikia.com",
  "gender": "Non-binary",
  "ip_address": "27.116.106.143"
}, {
  "id": 40,
  "first_name": "Guillemette",
  "last_name": "Wetherick",
  "email": "gwetherick13@reference.com",
  "gender": "Non-binary",
  "ip_address": "159.84.33.23"
}, {
  "id": 41,
  "first_name": "Jayme",
  "last_name": "Spires",
  "email": "jspires14@devhub.com",
  "gender": "Male",
  "ip_address": "179.4.248.124"
}, {
  "id": 42,
  "first_name": "Sharity",
  "last_name": "Lepick",
  "email": "slepick15@goo.ne.jp",
  "gender": "Non-binary",
  "ip_address": "117.191.33.201"
}, {
  "id": 43,
  "first_name": "Rustie",
  "last_name": "Sworne",
  "email": "rsworne16@ameblo.jp",
  "gender": "Male",
  "ip_address": "84.17.12.88"
}, {
  "id": 44,
  "first_name": "Pamelina",
  "last_name": "Lapere",
  "email": "plapere17@example.com",
  "gender": "Agender",
  "ip_address": "222.3.239.201"
}, {
  "id": 45,
  "first_name": "Clemence",
  "last_name": "Hultberg",
  "email": "chultberg18@timesonline.co.uk",
  "gender": "Non-binary",
  "ip_address": "137.119.114.171"
}, {
  "id": 46,
  "first_name": "Angele",
  "last_name": "Elderidge",
  "email": "aelderidge19@google.it",
  "gender": "Bigender",
  "ip_address": "58.117.56.11"
}, {
  "id": 47,
  "first_name": "Riobard",
  "last_name": "Grichukhanov",
  "email": "rgrichukhanov1a@biblegateway.com",
  "gender": "Polygender",
  "ip_address": "28.185.146.17"
}, {
  "id": 48,
  "first_name": "Melvyn",
  "last_name": "Gerrie",
  "email": "mgerrie1b@dyndns.org",
  "gender": "Bigender",
  "ip_address": "213.12.146.131"
}, {
  "id": 49,
  "first_name": "Clair",
  "last_name": "Dolligon",
  "email": "cdolligon1c@usgs.gov",
  "gender": "Polygender",
  "ip_address": "140.56.2.247"
}, {
  "id": 50,
  "first_name": "Olympia",
  "last_name": "Winslow",
  "email": "owinslow1d@cornell.edu",
  "gender": "Genderqueer",
  "ip_address": "207.200.138.62"
}, {
  "id": 51,
  "first_name": "Ulberto",
  "last_name": "Greensides",
  "email": "ugreensides1e@wisc.edu",
  "gender": "Male",
  "ip_address": "65.203.161.233"
}, {
  "id": 52,
  "first_name": "Hermon",
  "last_name": "Macon",
  "email": "hmacon1f@ustream.tv",
  "gender": "Male",
  "ip_address": "206.62.33.27"
}, {
  "id": 53,
  "first_name": "Clara",
  "last_name": "Keeting",
  "email": "ckeeting1g@disqus.com",
  "gender": "Bigender",
  "ip_address": "5.175.218.96"
}, {
  "id": 54,
  "first_name": "Nellie",
  "last_name": "Staddon",
  "email": "nstaddon1h@linkedin.com",
  "gender": "Genderfluid",
  "ip_address": "138.4.196.101"
}, {
  "id": 55,
  "first_name": "Dolores",
  "last_name": "Savory",
  "email": "dsavory1i@networkadvertising.org",
  "gender": "Male",
  "ip_address": "157.223.147.61"
}, {
  "id": 56,
  "first_name": "Chanda",
  "last_name": "Abatelli",
  "email": "cabatelli1j@ihg.com",
  "gender": "Genderfluid",
  "ip_address": "244.193.175.227"
}, {
  "id": 57,
  "first_name": "Hubie",
  "last_name": "Hinkes",
  "email": "hhinkes1k@ocn.ne.jp",
  "gender": "Female",
  "ip_address": "206.41.225.152"
}, {
  "id": 58,
  "first_name": "Lenci",
  "last_name": "Paske",
  "email": "lpaske1l@live.com",
  "gender": "Polygender",
  "ip_address": "103.151.47.83"
}, {
  "id": 59,
  "first_name": "Spense",
  "last_name": "Coxen",
  "email": "scoxen1m@digg.com",
  "gender": "Genderfluid",
  "ip_address": "182.200.177.23"
}, {
  "id": 60,
  "first_name": "Jeri",
  "last_name": "Clowsley",
  "email": "jclowsley1n@merriam-webster.com",
  "gender": "Genderfluid",
  "ip_address": "253.57.74.177"
}, {
  "id": 61,
  "first_name": "Cary",
  "last_name": "MacGorman",
  "email": "cmacgorman1o@china.com.cn",
  "gender": "Female",
  "ip_address": "249.178.67.252"
}, {
  "id": 62,
  "first_name": "Deanne",
  "last_name": "Lehrmann",
  "email": "dlehrmann1p@bigcartel.com",
  "gender": "Male",
  "ip_address": "58.99.57.215"
}, {
  "id": 63,
  "first_name": "Ardyce",
  "last_name": "Janew",
  "email": "ajanew1q@taobao.com",
  "gender": "Polygender",
  "ip_address": "231.98.211.25"
}, {
  "id": 64,
  "first_name": "Suellen",
  "last_name": "Clayal",
  "email": "sclayal1r@hostgator.com",
  "gender": "Polygender",
  "ip_address": "160.157.18.36"
}, {
  "id": 65,
  "first_name": "Pryce",
  "last_name": "Najera",
  "email": "pnajera1s@blogtalkradio.com",
  "gender": "Genderfluid",
  "ip_address": "202.214.159.234"
}, {
  "id": 66,
  "first_name": "Theo",
  "last_name": "Kingescot",
  "email": "tkingescot1t@chron.com",
  "gender": "Male",
  "ip_address": "50.185.21.255"
}, {
  "id": 67,
  "first_name": "Nicoline",
  "last_name": "Youngman",
  "email": "nyoungman1u@paypal.com",
  "gender": "Bigender",
  "ip_address": "76.202.73.71"
}, {
  "id": 68,
  "first_name": "Alanah",
  "last_name": "Riseborough",
  "email": "ariseborough1v@nyu.edu",
  "gender": "Polygender",
  "ip_address": "211.203.255.122"
}, {
  "id": 69,
  "first_name": "Luciana",
  "last_name": "Smissen",
  "email": "lsmissen1w@wisc.edu",
  "gender": "Agender",
  "ip_address": "70.42.8.193"
}, {
  "id": 70,
  "first_name": "Joly",
  "last_name": "Lindsey",
  "email": "jlindsey1x@netvibes.com",
  "gender": "Female",
  "ip_address": "42.144.88.75"
}, {
  "id": 71,
  "first_name": "Leda",
  "last_name": "Lillecrap",
  "email": "llillecrap1y@redcross.org",
  "gender": "Genderqueer",
  "ip_address": "21.89.202.249"
}, {
  "id": 72,
  "first_name": "Sisely",
  "last_name": "Bollum",
  "email": "sbollum1z@upenn.edu",
  "gender": "Genderfluid",
  "ip_address": "179.209.177.140"
}, {
  "id": 73,
  "first_name": "Alejandrina",
  "last_name": "Sunock",
  "email": "asunock20@squarespace.com",
  "gender": "Genderfluid",
  "ip_address": "81.70.240.228"
}, {
  "id": 74,
  "first_name": "Augusta",
  "last_name": "Dowker",
  "email": "adowker21@miitbeian.gov.cn",
  "gender": "Genderqueer",
  "ip_address": "58.202.170.163"
}, {
  "id": 75,
  "first_name": "Fifine",
  "last_name": "Prestage",
  "email": "fprestage22@usgs.gov",
  "gender": "Genderfluid",
  "ip_address": "131.39.149.93"
}, {
  "id": 76,
  "first_name": "Cordey",
  "last_name": "Van der Hoven",
  "email": "cvanderhoven23@utexas.edu",
  "gender": "Bigender",
  "ip_address": "222.228.213.113"
}, {
  "id": 77,
  "first_name": "Carlin",
  "last_name": "Garmons",
  "email": "cgarmons24@tiny.cc",
  "gender": "Genderqueer",
  "ip_address": "96.118.199.144"
}, {
  "id": 78,
  "first_name": "Rana",
  "last_name": "Pexton",
  "email": "rpexton25@webmd.com",
  "gender": "Non-binary",
  "ip_address": "99.148.114.193"
}, {
  "id": 79,
  "first_name": "Camel",
  "last_name": "Davidge",
  "email": "cdavidge26@wired.com",
  "gender": "Polygender",
  "ip_address": "18.86.117.175"
}, {
  "id": 80,
  "first_name": "Concettina",
  "last_name": "Poad",
  "email": "cpoad27@github.com",
  "gender": "Genderfluid",
  "ip_address": "88.217.60.26"
}, {
  "id": 81,
  "first_name": "Sampson",
  "last_name": "Lawson",
  "email": "slawson28@independent.co.uk",
  "gender": "Genderfluid",
  "ip_address": "11.21.69.113"
}, {
  "id": 82,
  "first_name": "Mina",
  "last_name": "Mochan",
  "email": "mmochan29@nih.gov",
  "gender": "Agender",
  "ip_address": "28.103.143.239"
}, {
  "id": 83,
  "first_name": "Evangelin",
  "last_name": "Hudd",
  "email": "ehudd2a@w3.org",
  "gender": "Female",
  "ip_address": "127.64.239.214"
}, {
  "id": 84,
  "first_name": "Goldina",
  "last_name": "Mandifield",
  "email": "gmandifield2b@indiatimes.com",
  "gender": "Agender",
  "ip_address": "205.251.70.52"
}, {
  "id": 85,
  "first_name": "Claresta",
  "last_name": "Kenn",
  "email": "ckenn2c@yolasite.com",
  "gender": "Polygender",
  "ip_address": "97.12.170.1"
}, {
  "id": 86,
  "first_name": "Nev",
  "last_name": "Krysztowczyk",
  "email": "nkrysztowczyk2d@hud.gov",
  "gender": "Genderfluid",
  "ip_address": "112.114.123.78"
}, {
  "id": 87,
  "first_name": "Florina",
  "last_name": "Thoresby",
  "email": "fthoresby2e@google.ru",
  "gender": "Bigender",
  "ip_address": "145.205.63.108"
}, {
  "id": 88,
  "first_name": "Juditha",
  "last_name": "Pariss",
  "email": "jpariss2f@reference.com",
  "gender": "Male",
  "ip_address": "75.238.158.200"
}, {
  "id": 89,
  "first_name": "Mirna",
  "last_name": "Rostron",
  "email": "mrostron2g@reddit.com",
  "gender": "Non-binary",
  "ip_address": "139.172.130.141"
}, {
  "id": 90,
  "first_name": "Jessalin",
  "last_name": "Bardell",
  "email": "jbardell2h@microsoft.com",
  "gender": "Non-binary",
  "ip_address": "208.10.165.51"
}, {
  "id": 91,
  "first_name": "Catie",
  "last_name": "Kynastone",
  "email": "ckynastone2i@squarespace.com",
  "gender": "Male",
  "ip_address": "222.208.147.69"
}, {
  "id": 92,
  "first_name": "Kore",
  "last_name": "Ciementini",
  "email": "kciementini2j@godaddy.com",
  "gender": "Male",
  "ip_address": "39.139.211.234"
}, {
  "id": 93,
  "first_name": "Maurise",
  "last_name": "Brock",
  "email": "mbrock2k@ezinearticles.com",
  "gender": "Genderfluid",
  "ip_address": "100.182.9.104"
}, {
  "id": 94,
  "first_name": "Yule",
  "last_name": "Tomczynski",
  "email": "ytomczynski2l@yelp.com",
  "gender": "Genderqueer",
  "ip_address": "255.209.88.236"
}, {
  "id": 95,
  "first_name": "Channa",
  "last_name": "Percifull",
  "email": "cpercifull2m@bing.com",
  "gender": "Genderqueer",
  "ip_address": "80.187.11.152"
}, {
  "id": 96,
  "first_name": "Codie",
  "last_name": "Croxon",
  "email": "ccroxon2n@vkontakte.ru",
  "gender": "Non-binary",
  "ip_address": "161.62.85.117"
}, {
  "id": 97,
  "first_name": "Sheena",
  "last_name": "Dreossi",
  "email": "sdreossi2o@macromedia.com",
  "gender": "Female",
  "ip_address": "86.15.35.219"
}, {
  "id": 98,
  "first_name": "Gram",
  "last_name": "Denisard",
  "email": "gdenisard2p@github.com",
  "gender": "Non-binary",
  "ip_address": "189.252.51.46"
}, {
  "id": 99,
  "first_name": "Stirling",
  "last_name": "Whitta",
  "email": "swhitta2q@ifeng.com",
  "gender": "Genderfluid",
  "ip_address": "233.34.194.37"
}, {
  "id": 100,
  "first_name": "Carlynne",
  "last_name": "Nunan",
  "email": "cnunan2r@ted.com",
  "gender": "Male",
  "ip_address": "159.204.245.69"
}]}
]"

end


