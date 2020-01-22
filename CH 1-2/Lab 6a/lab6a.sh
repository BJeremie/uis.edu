

$ curl -i -X PUT \
"$HOST/music/c961b1dcc8db6a01d81b37388c000799" \
-H "Content-Type: application/json" \
-d '{ "_id":"c961b1dcc8db6a01d81b37388c000799", 
"_rev": "1-2fe1dd1911153eb9df8460747dfe75a0",
"name": "Wings", 
"albums": ["Wild Life", "Band on the Run", "London Town"]
 }'
