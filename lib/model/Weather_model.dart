class WeatherModel {
  final String country;
  final DateTime date;
  final double avgTemp;
  final double minTemp;
  final double maxTemp;
  final String weatherStatus;
  final String image;

  WeatherModel({
    required this.country,
    required this.date,
    required this.avgTemp,
    required this.minTemp,
    required this.maxTemp,
    required this.weatherStatus,
    required this.image,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      country: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      weatherStatus: json['forecast']['forecastday'][0]['day']['condition']['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
