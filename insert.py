__author__ = 'Jason Ho'

import _mssql
import random
import datetime
import generate


# gets all user ids
def get_users_ids(conn):
    conn.execute_query("SELECT UserID FROM tblUSER")
    userids = []
    for row in conn:
        userids.append(row['UserID'])
    return userids


# gets all sleep ids
def get_sleeps_ids(conn):
    conn.execute_query("SELECT SleepID FROM tblSLEEP")
    sleepids = []
    for row in conn:
        sleepids.append(row['SleepID'])
    return sleepids


# gets all group ids
def get_groups_ids(conn):
    conn.execute_query("SELECT GroupID FROM tblGROUP")
    groupids = []
    for row in conn:
        groupids.append(row['GroupID'])
    return groupids


# gets all meal ids
def get_meals_ids(conn):
    conn.execute_query("SELECT MealID FROM tblMEAL")
    mealids = []
    for row in conn:
        mealids.append(row['MealID'])
    return mealids


# gets all food group ids
def get_food_groups_ids(conn):
    conn.execute_query("SELECT FoodGroupID FROM tblFOOD_GROUP")
    food_groupids = []
    for row in conn:
        food_groupids.append(row['FoodGroupID'])
    return food_groupids


# gets all location ids
def get_locations_ids(conn):
    conn.execute_query("SELECT LocationID FROM tblLOCATION")
    locationids = []
    for row in conn:
        locationids.append(row['LocationID'])
    return locationids


# gets all workout type ids
def get_workout_types_ids(conn):
    conn.execute_query("SELECT WorkoutTypeID FROM tblWORKOUT_TYPE")
    workout_typeids = []
    for row in conn:
        workout_typeids.append(row['WorkoutTypeID'])
    return workout_typeids


# gets all workout ids
def get_workouts_ids(conn):
    conn.execute_query("SELECT WorkoutID FROM tblWORKOUT")
    workoutids = []
    for row in conn:
        workoutids.append(row['WorkoutID'])
    return workoutids


# gets all badge ids
def get_badges_ids(conn):
    conn.execute_query("SELECT BadgeID FROM tblBADGES")
    badgeids = []
    for row in conn:
        badgeids.append(row['BadgeID'])
    return badgeids


# gets all activity ids
def get_activities_ids(conn):
    conn.execute_query("SELECT ActivityID FROM tblPLANNED_ACTIVITY")
    activityids = []
    for row in conn:
        activityids.append(row['ActivityID'])
    return activityids


# inserts a set of user objects
def insert_users(conn, users):
    query = ""
    for user in users:
        new_query = "INSERT INTO tblUSER([UserFName],[UserLName],[UserSex],[UserDOB],[UserEmail],[UserPassHash],[UserPassSalt]) VALUES('%s','%s',%s,'%s','%s','%s',%s);" % (user['FName'], user['LName'], user['sex'], user['dob'], user['email'], user['passHash'], user['salt'])
        query += new_query
        # conn.execute_non_query(new_query)
    conn.execute_non_query(query)


# insets n rows of biometric data
def insert_user_biometrics(conn, n):
    query = ""
    userids = get_users_ids(conn)

    for i in range(0, n):
        user = userids[random.randint(1, len(userids) - 1)]

        entry_date = generate.gen_datetime(2010, 2014)

        weight = random.uniform(80, 350)
        height = random.uniform(48, 84)

        new_query = "INSERT INTO tblUSER_HEIGHT_WEIGHT([UserID],[HWDate],[UserHeight],[UserWeight]) VALUES(%s,'%s',%s,%s);" % (user, entry_date.isoformat(), height, weight)
        query += new_query
        # conn.execute_non_query(new_query)
    conn.execute_non_query(query)


# inserts n messages from a list of messages
def insert_messages(conn, messages, n):
    query = ""
    userids = get_users_ids(conn)

    for i in range(0,n):
        message = messages[random.randint(0, len(messages) - 1)].strip()
        user1 = userids[random.randint(1, len(userids) - 1)]
        user2 = user1
        while user1 == user2:
            user2 = userids[random.randint(1, len(userids) - 1)]

        new_query = "INSERT INTO tblMESSAGE([MessageRecipietUserID],[MessageSenderUserID],[MessageContent]) VALUES(%s,%s,'%s');" % (user1, user2, message)
        query += new_query
        # conn.execute_non_query(new_query)
    conn.execute_non_query(query)


# inserts n friend connections
def insert_friends(conn, n):
    query = ""
    # gets a dictionary list of all current friend sets
    conn.execute_query("SELECT * FROM tblUSER_FRIEND")
    friend_sets = {}
    for row in conn:
        if friend_sets.get(str(row['UserID1'])) is None:
            friend_sets[str(row['UserID1'])] = []
        friend_sets[str(row['UserID1'])].append(row['UserID2'])

    userids = get_users_ids(conn)

    for i in range(0, n):
        user1 = userids[random.randint(1, len(userids) - 1)]
        user2 = userids[random.randint(1, len(userids) - 1)]

        if friend_sets.get(str(user1)) is None:
            friend_sets[str(user1)] = []

        if friend_sets.get(str(user2)) is None:
            friend_sets[str(user2)] = []

        # only insert friend connection if it does not already exist
        if not ((user2 in friend_sets[str(user1)]) or (user1 in friend_sets[str(user2)])):
            friend_sets[str(user1)].append(user2)
            new_query = "INSERT INTO tblUSER_FRIEND([UserID1],[UserID2]) VALUES(%d,%d);" % (user1, user2)
            query += new_query
            # conn.execute_non_query(new_query)
    conn.execute_non_query(query)


# insert n sleeps between starting and ending year with comment from list of comments
def insert_sleep(conn, start_year, end_year, comments, n):
    query = ""
    userids = get_users_ids(conn)

    for i in range(0, n):
        user = userids[random.randint(1, len(userids) - 1)]
        sleep_start = generate.gen_datetime(start_year, end_year)
        sleep_end = sleep_start + datetime.timedelta(hours=random.randint(6, 12))

        comment = ""

        # only insert comments 20% of the time
        if random.randint(1, 100) > 80:
            comment = comments[random.randint(0, len(comments) - 1)]

        new_query = "INSERT INTO tblSLEEP([UserID],[SleepStartTime],[SleepEndTime],[SleepComment]) VALUES(%s,'%s','%s','%s');" % (user, sleep_start.isoformat(), sleep_end.isoformat(), comment)
        query += new_query
        # conn.execute_non_query(new_query)
    conn.execute_non_query(query)


# insert sleep band data, must be tied to and during an existing sleep
def insert_sleep_band(conn, n):
    query = ""
    # get all sleeps then put them in a dictionary by ID
    sleepids = []
    all_sleeps = {}
    conn.execute_query("SELECT SleepID, SleepStartTime, SleepEndTime FROM tblSLEEP;")
    for row in conn:
        all_sleeps[str(row['SleepID'])] = {"SleepStartTime": row['SleepStartTime'], "SleepEndTime": row['SleepEndTime']}
        sleepids.append(row['SleepID'])

    for i in range(0, n):
        sleepid = sleepids[random.randint(0, len(sleepids) - 1)]

        # create a time for the data sometime during the sleep
        start_time = all_sleeps[str(sleepid)]['SleepStartTime']
        end_time = all_sleeps[str(sleepid)]['SleepEndTime']

        data_timeshift = (end_time - start_time) * random.uniform(.1, .9)

        data_time = start_time + data_timeshift
        data_time = datetime.datetime(data_time.year, data_time.month, data_time.day, data_time.hour, data_time.minute, data_time.second)

        new_query = "INSERT INTO tblSLEEP_BAND_DATA([SleepID],[SleepBandDataTime],[SleepMovementData]) VALUES(%d,'%s',%d);" % (sleepid, data_time.isoformat(), random.randint(1, 100))
        query += new_query
        # conn.execute_non_query(new_query)
    conn.execute_non_query(query)


# inserts groups with names from workouts and nouns
def insert_group(conn, groups):
    query = ""
    for group in groups:
        new_query = "INSERT INTO tblGROUP([GroupName],[GroupDesc]) VALUES('%s','%s');" % (group['name'], group['desc'])
        query += new_query
        # conn.execute_non_query(new_query)
    conn.execute_non_query(query)


# insert n users into groups
def insert_user_group(conn, n):
    query = ""
    userids = get_users_ids(conn)
    groupids = get_groups_ids(conn)

    # gets a dictionary list of all current user_group sets
    conn.execute_query("SELECT UserID, GroupID FROM tblUSER_GROUPS;")
    user_group_sets = {}
    for row in conn:
        # if the group isn't in the dictionary add it
        if user_group_sets.get(str(row['UserID'])) is None:
            user_group_sets[str(row['UserID'])] = [row['GroupID']]
        else: # otherwise add the user to the group
            user_group_sets[str(row['UserID'])].append(row['GroupID'])

    # perform the inserts
    for i in range(0, n):
        user = str(userids[random.randint(1, len(userids) - 1)])
        group = groupids[random.randint(1, len(groupids) - 1)]

        # add the group to our list if it isn't there
        if user_group_sets.get(user) is None:
            user_group_sets[user] = []

        # only insert friend connection if it does not already exist
        if group not in user_group_sets[user]:
            user_group_sets[user].append(group)
            new_query = "INSERT INTO tblUSER_GROUPS([UserID],[GroupID]) VALUES(%s,%d);" % (user, group)
            query += new_query
            # conn.execute_non_query(new_query)
    conn.execute_non_query(query)


# insert n meals, too lazy to do the sleeping check or a workout one, they can do both (or all 3) at once if they want
def insert_meal(conn, comments, n):
    query = ""
    userids = get_users_ids(conn)
    for i in range(0, n):
        meal_date = generate.gen_datetime(2010, 2014)
        comment = ""
        if random.randint(1,100) > 80:
            comment = comments[random.randint(0, len(comments) - 1)]

        new_query = "INSERT INTO tblMEAL([UserID],[MealDate],[MealComment]) VALUES(%d,'%s','%s');" % (userids[random.randint(0, len(userids) - 1)], meal_date.isoformat(), comment)
        query += new_query
        # conn.execute_non_query(new_query)
    conn.execute_non_query(query)


# inserts list of food groups
def insert_food_groups(conn, food_groups, descs):
    query = ""
    # get current groups so we don't add something that's already there
    cur_groups = {}
    conn.execute_query("SELECT FoodGroupName FROM tblFOOD_GROUP")
    for row in conn:
        cur_groups[row['FoodGroupName']] = True

    for food_group in food_groups:
        if cur_groups.get(food_group) is None:
            cur_groups[food_group] = True

            desc = ""
            if random.randint(1, 100) > 20:
                desc = descs[random.randint(0, len(descs) - 1)]

            new_query = "INSERT INTO tblFOOD_GROUP([FoodGroupName],[FoodGroupDesc]) VALUES('%s','%s');" % (food_group, desc)
            query += new_query
            # conn.execute_non_query(new_query)
    conn.execute_non_query(query)


# insert n meal_items
def insert_meal_item(conn, food, n):
    query = ""
    mealids = get_meals_ids(conn)
    food_groupids = get_food_groups_ids(conn)

    for i in range(0, n):
        food_name = ""
        k = random.randint(1, 4)
        for j in range(0, k):
            food_name += food[random.randint(0, len(food) - 1)]
            if not j >= k - 1:
                food_name += ", "

        new_query = "INSERT INTO tblMEAL_ITEM([MealID],[FoodGroupID],[MealItemDesc],[MealItemCalories]) VALUES(%d,%d,'%s',%d);" % (mealids[random.randint(0, len(mealids) - 1)], food_groupids[random.randint(0, len(food_groupids) - 1)], food_name, random.randint(0, 1000))
        query += new_query
        # conn.execute_non_query(new_query)
    conn.execute_non_query(query)


# insert n locations
def insert_location(conn, names, types, workouts, n):
    query = ""
    for i in range(0, n):
        name = names[random.randint(0, len(names) - 1)] + "''s " + workouts[random.randint(0, len(workouts) - 1)] + " " + types[random.randint(0, len(types) - 1)]

        new_query = "INSERT INTO tblLOCATION([LocationName],[LocationLat],[LocationLong]) VALUES('%s',%s,%s);" % (name, random.uniform(0, 180), random.uniform(0, 180))
        query += new_query
        # conn.execute_non_query(new_query)
    conn.execute_non_query(query)


# insert list of workout types
def insert_workout_type(conn, workouts, descs):
    query = ""
    # get current groups so we don't add something that's already there
    cur_groups = {}
    conn.execute_query("SELECT WorkoutTypeName FROM tblWORKOUT_TYPE")
    for row in conn:
        cur_groups[row['WorkoutTypeName']] = True

    for workout in workouts:
        if cur_groups.get(workout) is None:
            cur_groups[workout] = True

            desc = ""
            if random.randint(1, 100) > 20:
                desc = descs[random.randint(0, len(descs) - 1)]

            new_query = "INSERT INTO tblWORKOUT_TYPE([WorkoutTypeName],[WorkoutTypeDesc],[WorkoutBasePts]) VALUES('%s','%s',%d);" % (workout, desc, random.randint(1, 100))
            query += new_query
            # conn.execute_non_query(new_query)
    conn.execute_non_query(query)


# Inserts n workouts
def insert_workout(conn, start_year, end_year, comments, n):
    query = ""
    userids = get_users_ids(conn)
    locationids = get_locations_ids(conn)
    workout_typeids = get_workout_types_ids(conn)

    for i in range(0, n):
        workout_start = generate.gen_datetime(start_year, end_year)
        workout_end = workout_start + datetime.timedelta(minutes=random.randint(30, 120))

        comment = ""
        calories = -1
        steps = 0

        rand = random.randint(1, 100)
        # only insert comments 20% of the time
        if rand > 80:
            comment = comments[random.randint(0, len(comments) - 1)]

        if rand > 80:
            steps = random.randint(0, 5000)

        if rand > 20:
            calories = random.randint(100, 500)

        new_query = "INSERT INTO tblWORKOUT([UserID],[WorkoutTypeID],[LocationID],[WorkoutStartTime],[WorkoutEndTime],[WorkoutComment],[WorkoutBandSteps],[WorkoutCaloriesBurned]) VALUES(%d,%d,%d,'%s','%s','%s',%d,%d);" % (userids[random.randint(0, len(userids) - 1)], workout_typeids[random.randint(0, len(workout_typeids) - 1)], locationids[random.randint(0, len(locationids) - 1)], workout_start.isoformat(), workout_end.isoformat(), comment, steps, calories)
        query += new_query
        # conn.execute_non_query(new_query)
    conn.execute_non_query(query)


# insert workout band data, must be tied to and during an existing sleep
def insert_workout_band(conn, n):
    query = ""
    workoutids = []
    all_workouts = {}

    # get workout data
    conn.execute_query("SELECT WorkoutID, WorkoutStartTime, WorkoutEndTime FROM tblWORKOUT;")
    for row in conn:
        all_workouts[str(row['WorkoutID'])] = {"WorkoutStartTime": row['WorkoutStartTime'], "WorkoutEndTime": row['WorkoutEndTime']}
        workoutids.append(row['WorkoutID'])

    for i in range(0, n):
        workoutid = workoutids[random.randint(0, len(workoutids) - 1)]

        # create a time for the data sometime during the sleep
        start_time = all_workouts[str(workoutid)]['WorkoutStartTime']
        end_time = all_workouts[str(workoutid)]['WorkoutEndTime']

        data_timeshift = (end_time - start_time) * random.uniform(.1, .9)

        data_time = start_time + data_timeshift
        data_time = datetime.datetime(data_time.year, data_time.month, data_time.day, data_time.hour, data_time.minute, data_time.second)

        new_query = "INSERT INTO tblWORKOUT_BAND_DATA([WorkoutID],[WorkoutBandDataTime],[WorkoutHeartRate]) VALUES(%d,'%s',%d);" % (workoutid, data_time.isoformat(), random.randint(1, 100))
        query += new_query
        # conn.execute_non_query(new_query)
    conn.execute_non_query(query)


# insert n badges
def insert_badge(conn, adverbs, adjectives, comments, n):
    query = ""
    for i in range(0, n):
        name = adverbs[random.randint(0, len(adverbs) - 1)] + " " + adjectives[random.randint(0, len(adjectives) - 1)]

        comment = ""
        if random.randint(0, 100) > 50:
            comment = comments[random.randint(0, len(comments) - 1)]

        new_query = "INSERT INTO tblBADGES([BadgeName],[BadgeDesc]) VALUES('%s','%s');" % (name, comment)
        query += new_query
        # conn.execute_non_query(new_query)
    conn.execute_non_query(query)


# insert n workoutType Badge associations
def insert_workout_type_badge(conn, n):
    query = ""
    badgeids = get_badges_ids(conn)
    workout_typeids = get_workout_types_ids(conn)

    # gets a dictionary list of all current badge_workout_type sets
    conn.execute_query("SELECT BadgeID, WorkoutTypeID FROM tblWORKOUT_TYPE_BADGES;")
    badge_type_sets = {}
    for row in conn:
        # if the badge isn't in the dictionary add it
        if badge_type_sets.get(str(row['BadgeID'])) is None:
            badge_type_sets[str(row['BadgeID'])] = [row['WorkoutTypeID']]
        else: # otherwise add the workout type to the badge
            badge_type_sets[str(row['BadgeID'])].append(row['WorkoutTypeID'])

    # perform the inserts
    for i in range(0, n):
        workout_type = workout_typeids[random.randint(1, len(workout_typeids) - 1)]
        badge = str(badgeids[random.randint(1, len(badgeids) - 1)])

        # add the badge to our list if it isn't there
        if badge_type_sets.get(badge) is None:
            badge_type_sets[badge] = []

        # only insert association if it does not already exist
        if workout_type not in badge_type_sets[badge]:
            badge_type_sets[badge].append(workout_type)
            new_query = "INSERT INTO tblWORKOUT_TYPE_BADGES([WorkoutTypeID],[BadgeID],[WorkoutPtsReq]) VALUES(%d,%s,%d);" % (workout_type, badge, random.randint(5000, 10000))
            query += new_query
            # conn.execute_non_query(new_query)
    conn.execute_non_query(query)


# inserts n planned activities
def insert_planned_activity(conn, start_year, end_year, adjectives, workouts, comments, n):
    query = ""
    userids = get_users_ids(conn)
    locationids = get_locations_ids(conn)

    for i in range(0, n):
        user = userids[random.randint(1, len(userids) - 1)]
        location = locationids[random.randint(1, len(locationids) - 1)]
        activity_start = generate.gen_datetime(start_year, end_year)
        activity_end = activity_start + datetime.timedelta(minutes=random.randint(30, 180))

        name = adjectives[random.randint(0, len(adjectives) - 1)] + " " + workouts[random.randint(0, len(workouts) - 1)]

        comment = ""

        if random.randint(1, 100) > 50:
            comment = comments[random.randint(0, len(comments) - 1)]

        new_query = "INSERT INTO tblPLANNED_ACTIVITY([UserID],[LocationID],[IsGroup],[ActivityName],[ActivityStartDate],[ActivityEndDate],[ActivityDesc]) VALUES(%d,%d,%d,'%s','%s','%s','%s');" % (user, location, random.randint(0, 1), name, activity_start.isoformat(), activity_end.isoformat(), comment)
        query += new_query
        # conn.execute_non_query(new_query)
    conn.execute_non_query(query)


# insert n workoutType Group associations
def insert_group_workout_type(conn, n):
    query = ""
    groupids = get_groups_ids(conn)
    workout_typeids = get_workout_types_ids(conn)

    # gets a dictionary list of all current group_workout_type sets
    conn.execute_query("SELECT GroupID, WorkoutTypeID FROM tblGROUP_WORKOUT_TYPE;")
    group_type_sets = {}
    for row in conn:
        # if the group isn't in the dictionary add it
        if group_type_sets.get(str(row['GroupID'])) is None:
            group_type_sets[str(row['GroupID'])] = [row['WorkoutTypeID']]
        else: # otherwise add the workout type to the group
            group_type_sets[str(row['GroupID'])].append(row['WorkoutTypeID'])

    # perform the inserts
    for i in range(0, n):
        workout_type = workout_typeids[random.randint(1, len(workout_typeids) - 1)]
        group = str(groupids[random.randint(1, len(groupids) - 1)])

        # add the group to our list if it isn't there
        if group_type_sets.get(group) is None:
            group_type_sets[group] = []

        # only insert association if it does not already exist
        if workout_type not in group_type_sets[group]:
            group_type_sets[group].append(workout_type)
            new_query = "INSERT INTO tblGROUP_WORKOUT_TYPE([GroupID],[WorkoutTypeID]) VALUES(%s,%d);" % (group, workout_type)
            query += new_query
            # conn.execute_non_query(new_query)
    conn.execute_non_query(query)


# insert n Activity Group associations
def insert_group_activity(conn, n):
    query = ""
    activityids = get_activities_ids(conn)
    groupids = get_groups_ids(conn)

    # gets a dictionary list of all current group_workout_type sets
    conn.execute_query("SELECT ActivityID, GroupID FROM tblGROUP_ACTIVITY;")
    activity_group_sets = {}
    for row in conn:
        # if the group isn't in the dictionary add it
        if activity_group_sets.get(str(row['ActivityID'])) is None:
            activity_group_sets[str(row['ActivityID'])] = [row['GroupID']]
        else: # otherwise add the workout type to the group
            activity_group_sets[str(row['ActivityID'])].append(row['GroupID'])

    all_activities = {}
    conn.execute_query("SELECT ActivityID, IsGroup FROM tblPLANNED_ACTIVITY")
    for row in conn:
        all_activities[str(row['ActivityID'])] = row['IsGroup']

    # perform the inserts
    for i in range(0, n):
        group = groupids[random.randint(1, len(groupids) - 1)]
        activity = str(activityids[random.randint(1, len(activityids) - 1)])

        if all_activities[activity] is True:
            # add the activity to our list if it isn't there
            if activity_group_sets.get(activity) is None:
                activity_group_sets[activity] = []

            # only insert association if it does not already exist
            if group not in activity_group_sets[activity]:
                activity_group_sets[activity].append(group)
                new_query = "INSERT INTO tblGROUP_ACTIVITY([GroupID],[ActivityID]) VALUES(%d,%s);" % (group, activity)
                query += new_query
                # conn.execute_non_query(new_query)
    conn.execute_non_query(query)