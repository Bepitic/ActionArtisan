import json
import openai
import env as config

print('Loading function')

def lambda_handler(event, context):
    print(event)
    event = event["body"]
    event = json.loads(event)
    # print(context)
    print("name = " + event['name'])
    print("race = " + event['race'])
    print("action = " + event['action'])
    print("dice = " + event['dice'])
    print("difficulty = " + event['difficulty'])

    difficulty_str = diff(int(event['difficulty']))
    luck_outcome = luck(int(event['dice']), int(event['difficulty']))
    print("b4 openai")

    openai.api_key = config.KEY
    res = openai.ChatCompletion.create(
      model="gpt-3.5-turbo",
      messages=[
            {"role": "system", "content": "You are a Dungeon Master."},
            {"role": "user", "content": f"Explain how '{event['name']}' a {event['race']} tried to {event['action']} of {difficulty_str} difficulty and got an{luck_outcome}, in one paragraph"}
        ]
    )
    print("after openai")
    print(res)
    return {
        'statusCode': 200,
        'headers': {
            "Access-Control-Allow-Origin": '*',
        },
        'body': json.dumps(res['choices'][0]['message'])
    }
    # return res['choices'][0]['message']

def luck(luck, difficult):
    achievement_scale = [
        "Catastrophic Failure",
        "Significant Failure",
        "Major Struggle",
        "Partial Failure",
        "Barely Missed It",
        "Barely Got It",
        "Lucky Success",
        "Solid Success",
        "Great Success",
        "Exceptional Achievement"
      ]

    if luck == 1:
        return achievement_scale[0]
    if luck == 20:
        return achievement_scale[9]

    difference = luck - difficult
    resp = achievement_scale[5]

    if difference < 0:
        resp = achievement_scale[4]
    if difference < -2:
        resp = achievement_scale[3]
    if difference < -5:
        resp = achievement_scale[2]
    if difference < -7:
        resp = achievement_scale[1]

    if difference >= 0:
        resp = achievement_scale[5]
    if difference >= 2:
        resp = achievement_scale[6]
    if difference >= 5:
        resp = achievement_scale[7]
    if difference >= 7:
        resp = achievement_scale[8]

    return resp

def diff(num):

    difficulty_scale = [
      "Extremely Easy",
      "Very Easy",
      "Quite Easy",
      "Easy",
      "Moderately Easy",
      "Fairly Easy",
      "Slightly Easy",
      "Somewhat Easy",
      "Neutral/Moderate",
      "Somewhat Challenging",
      "Slightly Challenging",
      "Fairly Challenging",
      "Moderately Challenging",
      "Challenging",
      "Quite Challenging",
      "Difficult",
      "Very Difficult",
      "Extremely Difficult",
      "Nearly Impossible",
      "Impossible"
    ]

    return difficulty_scale[num]
