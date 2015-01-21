import json,sys

obj=json.load(sys.stdin)

for i in obj["items"]:
	if sys.argv[1] in i["currentState"]["info"]:
		cid = i["currentState"]["info"][sys.argv[1]]["containerID"]
		cid = cid.replace("docker://","")

		print cid

