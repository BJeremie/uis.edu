
use blogger 


db.users.insertMany([
{_id:ObjectId("5bb26043708926e438db6cad"), name: "Alex", email:"alex@aol.com"},
{_id:ObjectId("5bb26043708926e438db6cae"), name: "Albert", email:"albert@aol.com"},
{_id:ObjectId("5bb26043708926e438db6caf"), name: "alain", email:"alain@aol.com",
blogs {
  title : "Mr",
  body: "School",
  autor: "Alex"
  comments : [
    { user_id: "1", comment:"Test ", approved:"Yes", created_at:"11-20-2019"]},
   ]
}
}
])


db.users.find().pretty()

db.users.find({"_id" : ObjectId("5bb26043708926e438db6cad")}) 


blogs {
  title : "Mr",
  body: "School",
  autor: "Alex"
  comments : [
    { user_id: "1", comment:"Test ", approved:"Yes", created_at:"11-20-2019"]},
   ]
}


