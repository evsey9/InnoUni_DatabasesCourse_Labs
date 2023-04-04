import datetime

from pymongo import MongoClient
import datetime
client = MongoClient("mongodb://localhost") # will connect to localhost
db = client['test']
posts = db.restaurants


def add_specific_restaurant():
	building = '126'
	street = 'Sportivnaya'
	zipcode = '420500'
	coord = [-73.9557413, 40.7720266]
	address = {'building': building, 'coord': coord, 'street': street, 'zipcode': zipcode}
	borough = 'Innopolis'
	cuisine = 'Serbian'
	restaurant_id = '41712354'
	grades = [{'date': datetime.datetime(2023, 4, 4), 'grade': 'A', 'score': 11}]
	insert_query = {'address': address, 'borough': borough, 'cuisine': cuisine, 'grades': grades, 'restaurant_id': restaurant_id}
	return posts.insert_one(insert_query)


print("Inserted element ID:")
print(add_specific_restaurant())
