import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter, // Starting point of the gradient
            end: Alignment.bottomCenter, // Ending point of the gradient
            colors: [
              getThemeColor(weatherModel.weatherStatus),
              getThemeColor(weatherModel.weatherStatus)[300]!,
              getThemeColor(weatherModel.weatherStatus)[50]!,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${weatherModel.country}(${weatherModel.cityName.toLowerCase()})',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              'Updated at : ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 75),
                  child: Image(
                    image: NetworkImage('https:${weatherModel.image}'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Text(
                    weatherModel.avgTemp.round().toString(),
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'MaxTemp:${weatherModel.maxTemp.round()}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      'MinTemp:${weatherModel.minTemp.round()}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              weatherModel.weatherStatus,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
