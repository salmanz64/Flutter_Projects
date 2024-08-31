import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_2/hourly_forecast_items.dart';
import 'package:http/http.dart' as http;
import 'additonal_infoitem.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String cityName = "London";
      final res = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=$cityName,uk&APPID=b0b0aec29641e65acb1284d45b1d7aa2"));

      final data = jsonDecode(res.body);

      if (data["cod"] != "200") {
        throw "an unexpected error occured";
      }

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [IconButton(onPressed: () {
          setState(() {
            
          });
        }, icon: Icon(Icons.refresh))],
      ),
      body: FutureBuilder(
          future: getCurrentWeather(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            final data = snapshot.data!;
            final weather = data["list"][0];
            final temp = weather["main"]["temp"];
            final sky = weather["weather"][0]["main"];
            final humidity = weather["main"]["humidity"].toString();
            final pressure = weather["main"]["pressure"].toString();
            final windspeed = weather["wind"]["speed"].toString();
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      temp.toString(),
                                      style: const TextStyle(fontSize: 30),
                                    ),
                                    Icon(
                                      sky == "Clouds" || sky == "Rain"
                                          ? Icons.cloud
                                          : Icons.sunny,
                                      size: 64,
                                    ),
                                    SizedBox(height: 20),
                                    const Text(
                                      "Rain",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                              )))),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("weather Forecast",
                        style: TextStyle(fontSize: 30))),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        final hourlytemp =
                            data["list"][index + 1]["main"]["temp"].toString();
                        final hourlysky =
                            data["list"][index + 1]["weather"][0]["main"];
                        final hourlytime = DateTime.parse(
                            data["list"][index + 1]["dt_txt"].toString());
                        return HourlyForecast(
                          icon: hourlysky == "Clouds" || hourlysky == "Rain"
                              ? Icons.cloud
                              : Icons.sunny,
                          time: DateFormat.j().format(hourlytime),
                          temperature: hourlytemp,
                        );
                      })),
                ),
                const SizedBox(height: 20),
                Align(
                    alignment: Alignment.centerLeft,
                    child: const Text("weather Forecast",
                        style: TextStyle(fontSize: 30))),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdditionalInfoItem(
                      icon: Icons.water_drop,
                      label: "Humidity",
                      value: humidity,
                    ),
                    AdditionalInfoItem(
                      icon: Icons.air,
                      label: "wind speed",
                      value: windspeed,
                    ),
                    AdditionalInfoItem(
                      icon: Icons.beach_access,
                      label: "Pressure",
                      value: pressure,
                    )
                  ],
                )
              ]),
            );
          }),
    );
  }
}
