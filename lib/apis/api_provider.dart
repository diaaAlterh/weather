import 'package:dio/dio.dart';
import 'package:weather/model/weather_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _apiLink = 'https://api.openweathermap.org/data/2.5/forecast';

  /// weather api q to change the city
  Future<Weather?> getWeather() async {
    try {
      var response = await _dio.get(_apiLink, queryParameters: {
        'q': 'Dubai',
        'units': 'metric',
        'appid': '2defea45e73e5cd4fe88ee59e2623d6c',
      });
      print(response.data);
      return Weather.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }
}

ApiProvider apiProvider = ApiProvider();
