use("Cinema");
// nivel1 
// ej1

db.comments.find({}).limit(2)

db.users.countDocuments()

db.movies.countDocuments({"location.address.state":"CA"})

db.theaters.countDocuments({"genres":"Comedy"})

db.users.find({}).sort({_id:1}).limit(1)

//ej2

db.movies.find({year:1932,$or:[{"genres":"Drama"},{"languages":"French"}]})

//ej3

db.movies.find({countries:"USA","awards.wins":{$gte:5,$lte:9},year:{$gte:2012,$lte:2014}})



//nivel2
//ej1

db.comments.countDocuments({email:{$regex:/GAMEOFTHRON\.ES$/i}})

//ej2

db.theaters.aggregate([
    {$match:{"location.address.state":"DC"}},
    {$group:{_id:"$location.address.zipcode",total_cinemas:{$sum:1}}},
    {$sort:{total_cinemas:-1}}
])



//nivel3
//ej1

db.movies.aggregate([
    {$match:{directors:"John Landis","imdb.rating":{$gte:7.5,$lte:8}}},
    {$sort:{"imdb.rating":-1}}

])


//ej2

db.theaters.createIndex({"location.geo":"2dsphere"})