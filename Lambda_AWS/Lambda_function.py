import Scales_data as dta
import json
import openai
import os
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)
logger.info('Loading function')

def lambda_handler(event:dict, context:dict[str,object]) -> dict[str,object]:
    '''
    Returns the reversed String.

    Parameters:
        event (json):The http call that came to the lambda in json format.
        context (dict):The contex object provides methods and properties that provide information about the invocation, function, and execution environment.

    Returns:
        return(str): A .   
    '''
  
    event_body = event["body"]
    e_body_json = json.loads(event_body)
    logger.info("name = " + e_body_json['name'])
    logger.info("race = " + e_body_json['race'])
    logger.info("action = " + e_body_json['action'])
    logger.info("dice = " + e_body_json['dice'])
    logger.info("difficulty = " + e_body_json['difficulty'])

    difficulty_str = dta.difficulty_scale[int(e_body_json['difficulty'])]
    luck_outcome = luck(int(e_body_json['dice']), int(e_body_json['difficulty']))
    logger.info("b4 openai")

    openai.api_key = os.environ['KEY']
    res = openai.ChatCompletion.create(
      model="gpt-3.5-turbo",
      messages=[
            {"role": "system", "content": "You are a Dungeon Master."},
            {"role": "user", "content": f"Explain how '{e_body_json['name']}' a {e_body_json['race']} tried to {e_body_json['action']} of {difficulty_str} difficulty and got an{luck_outcome}, in one paragraph"}
        ]
    )
    logger.info("after openai")
    logger.info(res)
    return {
        'statusCode': 200,
        'headers': {
            "Access-Control-Allow-Origin": '*',
        },
        'body': json.dumps(res['choices'][0]['message'])
    }


def luck(luck: int, difficult: int) -> str:
    '''
    Returns the achivement String of an action based on the difference in the difficulty and the luck of the character that performs the action.

    Parameters:
        luck (int):The final modifier that the character has after throwing the dice.
        difficult (int):The difficulty that the DM(Dungeon Master) gives to the action of the character.

    Returns:
        resp(str):The achivement based on the difference in the difficulty and the luck of the character.   
    '''

    achievement_scale = dta.achievement_scale

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