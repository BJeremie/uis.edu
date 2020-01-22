curl -v -X PUT http://localhost:8091/riak/movies/drama \
-H "Content-Type: application/json" \
-d '{

"genres": "drama",

"title": "Rocketman",

"releasedate": "2019",

"runningtime": "1.0"

}'



curl -v -X PUT http://localhost:8091/riak/movies/drama \
-H "Content-Type: application/json" \
-d '{

"genres": "drama",

"title": "BlackMirror",

"releasedate": "2011",

"runningtime": "1.0"

}'

curl -v -X PUT http://localhost:8091/riak/movies/comedy \
-H "Content-Type: application/json" \
-d '{

"genres": "comedy",

"title": "MyLoveOrMyPassion",

"releasedate": "2017",

"runningtime": "1.5"
}'


curl -v -X PUT http://localhost:8091/riak/movies/comedy \
-H "Content-Type: application/json" \
-d '{
"genres": "comedy",

"title": "Soof2",

"releasedate": "2016",

"runningtime": "1.5"
}'


curl -v -X PUT http://localhost:8091/riak/movies/horror \
-H "Content-Type: application/json" \
-d '{

"genres": "horror",

"title": "CuteExorcist",

"releasedate": "2019",

"runningtime": "1.5"

}'

curl -v -X PUT http://localhost:8091/riak/movies/horror \
-H "Content-Type: application/json" \
-d '{
"genres": "horror",

"title": "LendaUrbana",

"releasedate": "2013",

"runningtime": "1.5"
}'


curl -i -X DELETE http://localhost:8091/riak/movies/drama/Rocketman\


