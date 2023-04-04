import datetime

from pymongo import MongoClient
import datetime
client = MongoClient("mongodb://localhost") # will connect to localhost
db = client['test']
posts = db.restaurants


def ex4_func():
	find_query = {'address.street': 'Prospect Park West'}
	for cur_query in posts.find(find_query):
		A_count = 0
		for cur_grade in cur_query['grades']:
			print(f"Checking entry {cur_query}")
			if cur_grade["grade"] == 'A':
				A_count += 1
		if A_count > 1:
			print("Deleting!")
			posts.delete_one({'_id': cur_query["_id"]})
		else:
			grade_entry = {'date': datetime.datetime(2023, 4, 4), 'grade': 'A', 'score': 10}
			existing_grades = cur_query["grades"]
			existing_grades.append(grade_entry)
			posts.update_one({'_id': cur_query["_id"]}, {'$set': {'grades': existing_grades}})
			print(f"Updated query to {cur_query}")


ex4_func()
