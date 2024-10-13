# Weather App

This is a weather application built using using Flutter, it uses the OpenWeatherMap API for the weather details

In this we have a screen directory iside which ou main screen of the app is present, I have created a different widget class and used it's constructor to increase the readability of the code

Inside services,first we have a weather_services file which calls the API and fetches the data in JSON and checks whether the statusCode of the API call is 200 or not and we have Model class named weather_model, this class is made to determine which details we want to display in the app, another file weather_provider is used for fetching the weather details from the weather_services file

To use the app just open the app and enter the name of the city, if the city name is correct it will show the details like, temperature, conditions, humidity, wind speed
