import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/search_screen.dart';

import 'cubits/get_weather_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) =>
            BlocBuilder<GetWeatherCubit, GetWeatherState>(
              builder: (context, state) {
                return MaterialApp(
                  theme: ThemeData(
                      primarySwatch: getThemeColor(
                          BlocProvider
                              .of<GetWeatherCubit>(context)
                              .weatherModel
                              ?.weatherCondition)),
                  routes: {
                    HomeScreen.id: (context) => HomeScreen(),
                    SearchScreen.id: (context) => const SearchScreen(),
                  },
                  debugShowCheckedModeBanner: false,
                  home: const Scaffold(
                    body: HomeScreen(),
                  ),
                );
              },
            ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
    case 'Cloudy':
    case 'Partly cloudy':
      return Colors.amber;

    case 'Blizzard':
    case 'Patchy rain possible':
    case 'Heavy rain':
      return Colors.lightBlue;

    default:
      return Colors.blue;
  }
}
