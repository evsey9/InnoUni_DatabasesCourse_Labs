from pymongo import MongoClient
client = MongoClient("mongodb://localhost") # will connect to localhost
db = client['test']
posts = db.restaurants


def all_irish_cuisines():
	return posts.find({'cuisine': 'Irish'})


def all_irish_or_russian_cuisines():
	return posts.find({ '$or': [{'cuisine': 'Irish'}, {'cuisine': 'Russian'}]})


def restaurant_at_specific_address():
	address = "Prospect Park West 284, 11215"
	building = address.split(' ')[-2][:-1]
	street = ' '.join(address.split(' ')[:-2])
	zipcode = address.split(' ')[-1]
	find_query = {'address.building': building, 'address.street': street, 'address.zipcode': zipcode}
	# print(find_query)
	return posts.find(find_query)


print("Irish cuisines:")
for i in all_irish_cuisines():
	print(i)

print("Irish or Russian cuisines:")
for i in all_irish_or_russian_cuisines():
	print(i)

print("Restaurant at Prospect Park West 284, 11215:")
for i in restaurant_at_specific_address():
	print(i)