__author__ = 'Jason Ho'

import _mssql
import json
import generate
import insert
import datetime

# prepare to start
print(str(datetime.datetime.now()) + " | " + "starting...")

# load db authentication into an object
db = json.loads(open('db.json').read())

# connect to db
conn = _mssql.connect(server=db['server'], user=db['user'], password=db['pass'],
    database=db['db'])

# load text files
names = open('autogen/names.txt').read().splitlines()
domains = open('autogen/topLevelDomains.txt').read().splitlines()
quotes = open('autogen/quotes.txt').read().splitlines()
sleep_comments = open('autogen/sleepComments.txt').read().splitlines()
workouts = open('autogen/workouts.txt').read().splitlines()
nouns = open('autogen/nouns.txt').read().splitlines()
food_comments = open('autogen/foodComments.txt').read().splitlines()
food_groups = open('autogen/foodGroups.txt').read().splitlines()
food = open('autogen/food.txt').read().splitlines()
locationTypes = open('autogen/locationTypes.txt').read().splitlines()
workout_comments = open('autogen/workoutComments.txt').read().splitlines()
adjectives = open('autogen/adjectives.txt').read().splitlines()
adverbs = open('autogen/adverbs.txt').read().splitlines()

# Generate stuff
gen_users = generate.users(names, domains, 1950, 2002, 100)
gen_groups = generate.groups(workouts, nouns, quotes, 10)

# Populate tables
insert.insert_users(conn, gen_users)
print(str(datetime.datetime.now()) + " | " + "users finished...")
insert.insert_user_biometrics(conn, 200)
print(str(datetime.datetime.now()) + " | " + "biometrics finished...")
insert.insert_messages(conn, quotes, 100)
print(str(datetime.datetime.now()) + " | " + "messages finished...")
insert.insert_friends(conn, 200)
print(str(datetime.datetime.now()) + " | " + "friends finished...")
insert.insert_sleep(conn, 2010, 2014, sleep_comments, 100)
print(str(datetime.datetime.now()) + " | " + "sleep finished...")
insert.insert_sleep_band(conn, 50)
print(str(datetime.datetime.now()) + " | " + "sleep Band finished...")
insert.insert_group(conn, gen_groups)
print(str(datetime.datetime.now()) + " | " + "groups finished...")
insert.insert_user_group(conn, 200)
print(str(datetime.datetime.now()) + " | " + "user groups finished...")
insert.insert_meal(conn, food_comments, 200)
print(str(datetime.datetime.now()) + " | " + "meals finished...")
insert.insert_food_groups(conn, food_groups, food_comments)
print(str(datetime.datetime.now()) + " | " + "food groups finished...")
insert.insert_meal_item(conn, food, 500)
print(str(datetime.datetime.now()) + " | " + "meal items finished...")
insert.insert_location(conn, names, locationTypes, workouts, 10)
print(str(datetime.datetime.now()) + " | " + "locations finished...")
insert.insert_workout_type(conn, workouts, quotes)
print(str(datetime.datetime.now()) + " | " + "workout types finished...")
insert.insert_workout(conn, 2010, 2014, workout_comments, 400)
print(str(datetime.datetime.now()) + " | " + "workouts finished...")
insert.insert_workout_band(conn, 200)
print(str(datetime.datetime.now()) + " | " + "workout bands finished...")
insert.insert_badge(conn, adverbs, adjectives, workout_comments, 10)
print(str(datetime.datetime.now()) + " | " + "badges finished...")
insert.insert_workout_type_badge(conn, 50)
print(str(datetime.datetime.now()) + " | " + "workout type badge associations finished...")
insert.insert_planned_activity(conn, 2010, 2014, adjectives, workouts, workout_comments, 500)
print(str(datetime.datetime.now()) + " | " + "planned activities finished...")
insert.insert_group_workout_type(conn, 50)
print(str(datetime.datetime.now()) + " | " + "group workout type associations finished...")
insert.insert_group_activity(conn, 50)
print(str(datetime.datetime.now()) + " | " + "group activity associations finished...")

print(str(datetime.datetime.now()) + " | " + "all finished!")