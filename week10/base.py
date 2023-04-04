from pymongo import MongoClient
client = MongoClient("mongodb://localhost") # will connect to localhost
db = client['test']


posts = db.restaurants

print(posts.find_one())