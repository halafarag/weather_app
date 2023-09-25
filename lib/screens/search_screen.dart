import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static String id = 'SearchScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Search City'),
      ),
      body: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
             var getWeatherCubit=BlocProvider.of<GetWeatherCubit>(context);
             getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              hintText: 'Enter City Name',
              labelText: 'Search',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow)),
            ),
          ),
        ),
      ),
    );
  }
}

