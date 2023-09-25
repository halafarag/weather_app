import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_body_info.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    GetWeatherCubit cubit = GetWeatherCubit();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchScreen.id);
              },
              icon:const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          if (state is GetWeatherInitial) {
            return const NoWeatherBody();
          } else if (state is WeatherLoaded) {
            return  WeatherBodyInfo(
              weather:state.weatherModel
            );
          } else
            return  Text('Opps there is a problem');
        },
      ),
    );
  }
}
