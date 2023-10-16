import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    setState(() {
                      cityName = value;
                    });
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
              // Define the WeatherDisplay widget
              WeatherDisplay(),
            ],
          ),
        ),
      ),
    );
  }
}

// Define the WeatherData class with its properties
class WeatherData {
  final int temperature;
  final int humidity;
  final String conditions;

  WeatherData({required this.temperature, required this.humidity, required this.conditions});
}

// Define the WeatherDisplay widget
class WeatherDisplay extends StatelessWidget {
  final WeatherData weatherData =
      WeatherData(temperature: 25, humidity: 80, conditions: 'Cloudy');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Temperature: ${weatherData.temperature}',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          'Humidity: ${weatherData.humidity}',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          'Conditions: ${weatherData.conditions}',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
