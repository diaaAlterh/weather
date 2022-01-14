import 'package:rxdart/rxdart.dart';
import 'package:weather/Apis/api_provider.dart';
import 'package:weather/model/weather_model.dart';

class WeatherBloc {
  ///weather bloc, calling api is happening here
  Future<Weather?> _fetchWeather() => apiProvider.getWeather();

  final _weatherBlocFetcher = BehaviorSubject<Weather>();

  Stream<Weather> get weather => _weatherBlocFetcher.stream;

  fetch() async {
    try {
      Weather? weather = await _fetchWeather();
      _weatherBlocFetcher.sink.add(weather!);
    } catch (e) {
      _weatherBlocFetcher.sink.addError(e);
      print('error $e');
    }
  }

  dispose() {
    _weatherBlocFetcher.close();
  }
}

final weatherBloc = WeatherBloc();
