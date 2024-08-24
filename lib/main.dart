import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherStatus),
                appBarTheme: AppBarTheme(
                  backgroundColor: getThemeColor(BlocProvider.of<
                          GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherStatus), // This sets the AppBar's background color
                ),
              ),
              home: const HomePage(),
            );
          },
        ),
      ),
    );
  }
}

// function
MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.grey;
  }
  if (condition == 'Sunny') {
    return Colors.amber;
  } else if (condition == 'Partly cloudy') {
    return Colors.lightBlue;
  } else if (condition == 'Cloudy') {
    return Colors.grey;
  } else if (condition == 'Overcast') {
    return Colors.blueGrey;
  } else if (condition == 'Mist') {
    return Colors.teal;
  } else if (condition == 'Patchy rain possible' ||
      condition == 'Light rain' ||
      condition == 'Moderate rain') {
    return Colors.blue;
  } else if (condition == 'Patchy snow possible' ||
      condition == 'Light snow' ||
      condition == 'Moderate snow') {
    return Colors.cyan;
  } else if (condition == 'Thundery outbreaks possible') {
    return Colors.deepPurple;
  } else if (condition == 'Blizzard') {
    return Colors.indigo;
  } else if (condition == 'Fog') {
    return Colors.lightGreen;
  } else if (condition == 'Heavy snow' || condition == 'Heavy rain') {
    return Colors.deepOrange;
  } else if (condition == 'Patchy light rain with thunder') {
    return Colors.orange;
  }
  // Default color if none of the conditions match
  return Colors.blue;
}
