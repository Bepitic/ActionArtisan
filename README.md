# Check it out at [ActionArtisan](https://main.dc3wixtzurzli.amplifyapp.com).
# ActionArtisan  App

The ActionArtisan app is a tool designed to assist Dungeon Masters (DMs) in creating vivid and immersive descriptions for various actions and scenarios in their tabletop role-playing games. This app leverages the power of OpenAI's natural language generation to provide dynamic and creative narratives that enhance the gaming experience.

<!-- ![App Screenshot](screenshot.png) Replace with an actual screenshot of your app -->
<img src="screenshot.png" width=30% height=30%>

## Features

- Generate Descriptions: Quickly create rich descriptions for player actions, combat sequences, environments, and more.
- Seamless Integration: The app's frontend is developed using Flutter, ensuring a smooth and intuitive user experience on both Android and iOS platforms.
- AI-powered Narration: The app communicates with a AWS Lambda function through API Gateway, which then interacts with an OpenAI API to retrieve narrations based on the input.
- Customizable Narratives: Tailor the generated narratives by providing specific details, tones, or styles, enhancing the uniqueness of your storytelling.

## Installation

1. Clone this repository: `git clone https://github.com/bepitic/ActionArtisan.git`

### Flutter

1. Navigate to the `explain_rol` directory: `cd explain_rol`
2. Add the link and path to the API in `_env`
3. Rename `_env` to `.env`
4. Install dependencies: `flutter pub get`
5. Run the app: `flutter run`

### AWS Lambda Backend

The app's backend is powered by AWS Lambda and API Gateway, which communicate with OpenAI's API to generate narrations. Make sure to set up the backend by following these steps:

1. Create an AWS Lambda function that handles the API Gateway requests. 
2. Copy the Lambda file `Lambda_AWS/Lambda_function.py` into aws lambda.
3. Provide the api key of openAI in the KEY variable of _env.py
4. Copy `_env.py` into the lambda function as `env.py` (without the `_` )
5. Set up an API Gateway with appropriate routes and methods(Push) to trigger the Lambda function.
6. Update the route and path of the API into the `.env` variable in flutter

## Usage

1. Launch the app on your Android or iOS device.
2. Provide the name of the character and its race.
3. Provide the difficulty of the action,and the final result of the dice(with all the modificators).
4. Tap the "Give me a Narration" button.
5. The app will send a request to the serverless backend, which communicates with OpenAI's API.
6. Once the narration is received, it will be displayed on the screen.
7. Customize the narration further or use it as-is in your game.

## Backend Configuration

3. Obtain an API key or authentication token from OpenAI for making requests to their API.
4. Configure the app's frontend to send requests to the API Gateway endpoint, including the necessary authentication.

## Credits

- Flutter: [https://flutter.dev/](https://flutter.dev/)
- OpenAI: [https://openai.com/](https://openai.com/)

## License

This project is licensed under the [GNU-3 License](https://github.com/Bepitic/ActionArtisan/blob/main/LICENSE).
