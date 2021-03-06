import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/util/convert_icon.dart';
import 'package:weather_forecast/util/forecast_utils.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastlist = snapshot.data.list;
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${snapshot.data.city.name}, ${snapshot.data.city.country}",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
          Text(
            "${Util.getFormatedDate(new DateTime.fromMillisecondsSinceEpoch(forecastlist[0].dt * 1000))}",
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getWeatherIcon(
                weatherDescription: forecastlist[0].weather[0].main,
                color: Colors.pinkAccent,
                size: 198),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${forecastlist[0].temp.day.toStringAsFixed(0)} °F ",
                  style: TextStyle(fontSize: 40.0),
                ),
                Text(
                    " ${forecastlist[0].weather[0].description.toUpperCase()}"),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecastlist[0].speed.toStringAsFixed(1)} mi/h"),
                      Icon(
                        FontAwesomeIcons.wind,
                        size: 20,
                        color: Colors.brown,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecastlist[0].humidity.toStringAsFixed(0)} %"),
                      Icon(FontAwesomeIcons.solidGrinBeamSweat,
                          size: 20, color: Colors.brown),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecastlist[0].temp.max} °F"),
                      Icon(FontAwesomeIcons.temperatureHigh,
                          size: 20, color: Colors.brown),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
  return midView;
}
