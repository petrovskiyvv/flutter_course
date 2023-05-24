import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Weather Forecast"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          _citySearch(),
          const Divider(),
          _cityDetail(),
          const Divider(),
          _temperatureDetail(),
          const Divider(),
          _extraWeatherDetail(),
          const Divider(height: 30,),
          const Text(
            "7-DAY WEATHER FORECAST",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 150,
            child: SevenDayForecast(),
          ),
        ],
      ),
    ),
  );
}

Row _citySearch() {
  return Row(
    children: const <Widget>[
      Icon(Icons.search),
      SizedBox(
        width: 5,
      ),
      Text("Enter City Name"),
    ],
  );
}

Column _cityDetail() {
  return Column(
    children: const <Widget>[
      Text(
        "Sverdlovskaya oblast'",
        style: TextStyle(fontSize: 35),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "Tuesday, May 23, 2023",
        style: TextStyle(fontSize: 20),
      ),
    ],
  );
}

Row _temperatureDetail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Icon(
        Icons.sunny,
        size: 100,
      ),
      Column(
        children: const [
          Text(
            "14°C",
            style: TextStyle(fontSize: 50),
          ),
          Text(
            "SUNNY",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    ],
  );
}

Row _extraWeatherDetail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: const [
          Icon(
            Icons.wind_power,
            size: 40,
          ),
          Text(
            "5",
            style: TextStyle(fontSize: 40),
          ),
          Text(
            "m/s",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
      Column(
        children: const [
          Icon(
            Icons.water_drop,
            size: 40,
          ),
          Text(
            "40",
            style: TextStyle(fontSize: 40),
          ),
          Text(
            "%",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
      Column(
        children: const [
          Icon(
            Icons.atm,
            size: 40,
          ),
          Text(
            "746",
            style: TextStyle(fontSize: 40),
          ),
          Text(
            "mm Hg",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    ],
  );
}

class SevenDayForecast extends StatelessWidget {
  const SevenDayForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return _sevenDayForecast();
  }
}

Widget _sevenDayForecast() {
  final List<String> items =
      List<String>.generate(7, (index) => "Someday $index");
  final List<String>  intTemperature = List<String>.generate(7, (index) =>  Random().nextInt(30).toString());
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemExtent: 130,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white70,
          child: Column(children: [
            const SizedBox(height: 8),
            Text(items[index], style: const TextStyle(fontSize: 20),),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${intTemperature[index]}°C ', style: const TextStyle(fontSize: 25),),
                const Icon(Icons.sunny, size: 30,),
              ],
            )
          ]),
        );
      });
}
