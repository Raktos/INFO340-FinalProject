__author__ = 'Jason Ho'

import random
import datetime


def gen_datetime(start_year, end_year, start_month=1, end_month=12, start_day=1, end_day=28, start_hour=1, end_hour=23, start_min=1, end_min=59):
    year = random.randint(start_year, end_year)
    month = random.randint(start_month, end_month)
    day = random.randint(start_day, end_day)
    hour = random.randint(start_hour, end_hour)
    minute = random.randint(start_min, end_min)
    return datetime.datetime(year, month, day, hour, minute)


# generate n random users
def users(names, domains, start_year, end_year, n):
    gen_users = []
    for i in range(0, n):
        # get a random name and sex
        firstName = names[random.randint(0, len(names) - 1)]
        lastName = names[random.randint(0, len(names) - 1)]
        sex = random.randint(0, 1)

        # create an email and pass based on name
        email = firstName + '.' + lastName + '@' + names[random.randint(0, len(names) - 1)] + domains[random.randint(0, len(domains) - 1)]
        passHash = hash(firstName + lastName) % 100000
        salt = random.randint(1, 500)

        # generate a random birthdate between start and end
        dob = datetime.date(gen_datetime(start_year, end_year))

        # append new user as a dictionary
        gen_users.append({
            'FName': firstName,
            'LName': lastName,
            'sex': sex,
            'email': email,
            'passHash': passHash,
            'salt': salt,
            'dob': dob.isoformat()
        })
    return gen_users

# generate n random groups
def groups(workouts, nouns, descs, n):
    gen_groups = []
    for i in range(0, n):
        desc = ""
        if random.randint(1, 100) > 20:
            desc = descs[random.randint(0, len(descs) - 1)]

        gen_groups.append({
            'name': workouts[random.randint(0, len(workouts) - 1)] + " " + nouns[random.randint(0, len(nouns) - 1)],
            'desc': desc
        })
    return gen_groups