import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/model/Weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '3677bed892474b30b7a122242220806';
  WeatherServices({required this.dio});
  Future<WeatherModel> getCurrentWeather({required cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error,try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error,try later');
    }
  }
}
   