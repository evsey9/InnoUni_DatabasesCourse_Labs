import datetime

from pymongo import MongoClient
import datetime
client = MongoClient("mongodb://localhost") # will connect to localhost
db = client['test']
posts = db.restaurants


def remove_single_brooklyn_restaurant():
	remove_query = {'borough': 'Brooklyn'}
	return posts.delete_one(remove_query)


def remove_all_thai_cuisines():
	remove_query = {'cuisine': 'Thai'}
	return posts.delete_many(remove_query)


print("Number of deleted restaurants:")
print(remove_single_brooklyn_restaurant())

print("Number of deletes cuisines:")
print(remove_all_thai_cuisines())
