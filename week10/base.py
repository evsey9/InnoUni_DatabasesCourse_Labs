from pymongo import MongoClient
from bson.objectid import ObjectId
client = MongoClient("mongodb://localhost") # will connect to localhost
db = client['test']


posts = db.restaurants

print(posts.find_one({"_id": ObjectId('6427cf9a6091411bad4cc649')}))