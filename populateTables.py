__author__ = 'Jason Ho'

import _mssql
import json
import generate
import insert

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
gen_users = generate.users(names, domains, 1950, 2002, 5)
gen_groups = generate.groups(workouts, nouns, quotes, 5)

# Populate tables
insert.insert_users(conn, gen_users)
insert.insert_user_biometrics(conn, 5)
insert.insert_messages(conn, quotes, 5)
insert.insert_friends(conn, 5)
insert.insert_sleep(conn, 2010, 2014, sleep_comments, 5)
insert.insert_sleep_band(conn, 5)
insert.insert_group(conn, gen_groups)
insert.insert_user_group(conn, 5)
insert.insert_meal(conn, food_comments, 5)
insert.insert_food_groups(conn, food_groups, food_comments)
insert.insert_meal_item(conn, food, 10)
insert.insert_location(conn, names, locationTypes, workouts, 5)
insert.insert_workout_type(conn, workouts, quotes)
insert.insert_workout(conn, 2010, 2014, workout_comments, 5)
insert.insert_workout_band(conn, 5)
insert.insert_badge(conn, adverbs, adjectives, workout_comments, 10)
insert.insert_workout_type_badge(conn, 5)
insert.insert_planned_activity(conn, 2010, 2014, adjectives, workouts, workout_comments, 5)
insert.insert_group_workout_type(conn, 5)
insert.insert_group_activity(conn, 5)