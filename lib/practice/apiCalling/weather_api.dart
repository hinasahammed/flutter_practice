import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_practice/model/weather_model/weather_model.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherApi extends StatefulWidget {
  const WeatherApi({super.key});

  @override
  State<WeatherApi> createState() => _WeatherApiState();
}

class _WeatherApiState extends State<WeatherApi> {
  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
      ),
      body: weatherModel == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      weatherModel!.location!.name ?? '',
                      style: theme.textTheme.headlineLarge!.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      weatherModel!.location!.localtime ?? '',
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    Image.network(
                      weatherModel!.current!.condition!.icon ?? '',
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "${weatherModel!.current!.tempC.toString()}\u2103",
                      style: theme.textTheme.displayLarge!.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Icon(Icons.wind_power),
                            const Gap(5),
                            Text(
                              "${weatherModel!.current!.windMph.toString()} m/s",
                              style: theme.textTheme.bodyLarge,
                            )
                          ],
                        ),
                        const Gap(20),
                        Column(
                          children: [
                            const Icon(Icons.thermostat),
                            const Gap(5),
                            Text(
                              weatherModel!.current!.pressureMb.toString(),
                              style: theme.textTheme.bodyLarge,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future fetchWeather() async {
    final position = await getCurrentLocation();
    try {
      final response = await http.get(
          Uri.parse(
            "https://weatherapi-com.p.rapidapi.com/current.json?q=${position.latitude}%2C${position.longitude}",
          ),
          headers: {
            "x-rapidapi-host": "weatherapi-com.p.rapidapi.com",
            "x-rapidapi-key":
                "b65e9e1178msh7661c663c46802cp15188djsnc3290d348d6c",
          });
      if (response.statusCode == 200) {
        setState(() {
          weatherModel = WeatherModel.fromJson(jsonDecode(response.body));
        });
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
