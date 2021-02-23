import 'package:flutter/material.dart';
import 'package:weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/network/network.dart';
import 'package:weather_forecast/ui/bottom_view.dart';
import 'package:weather_forecast/ui/mid_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<WeatherForecastModel> forecaseObject;
  String _cityName = "Mumbai";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecaseObject = Network().getWeatherForecast(cityName: _cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
              future: forecaseObject,
              builder: (BuildContext context,
                  AsyncSnapshot<WeatherForecastModel> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      midView(snapshot),
                      bottomView(snapshot, context)
                    ],
                  );
                } else {
                  return Container(
                      child: Center(
                    child: CircularProgressIndicator(),
                  ));
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            hintText: "Enter City Name",
            prefixIcon: Icon(Icons.search),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            contentPadding: EdgeInsets.all(8.0)),
        onSubmitted: (val) {
          setState(() {
            _cityName = val;
            forecaseObject =
                new Network().getWeatherForecast(cityName: _cityName);
          });
        },
      ),
    );
  }
}
