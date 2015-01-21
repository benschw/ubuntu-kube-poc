import json,sys

obj=json.load(sys.stdin)

for i in obj["items"]:
	if sys.argv[1] in i["currentState"]["info"]:
		id = i["id"]

		print id

