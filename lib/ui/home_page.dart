import 'package:flutter/material.dart';
import 'package:weather/bloc/weather_bloc.dart';
import 'package:weather/helper/appColors.dart';
import 'package:weather/helper/utils.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/ui/items/dayItem.dart';
import 'package:weather/ui/widgets/animationScaleWidget.dart';
import 'package:weather/ui/widgets/helper_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    weatherBloc.fetch();
  }

  int _positionNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<Weather>(
          stream: weatherBloc.weather,
          builder: (context, AsyncSnapshot<Weather> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  helperWidget.weatherDay(
                      cityName: snapshot.data!.city!.name,
                      date: utils.format('E D/M/y',
                          snapshot.data!.list!.first.dtTxt ?? DateTime.now()),
                      weatherState:
                          snapshot.data!.list!.first.weather!.first.main,
                      tempMinMax:
                          '${snapshot.data!.list!.first.main!.tempMax.toInt()}/${snapshot.data!.list!.first.main!.tempMin.toInt()}\u00B0',
                      iconPath: helperWidget.imagePath[
                          snapshot.data!.list!.first.weather!.first.icon],
                      temp: snapshot.data!.list!.first.main!.temp
                          .toInt()
                          .toString(),
                      index: -1),
                  AnimationScaleWidget(
                    position: 0,
                    verticalOffset: 30,
                    // horizontalOffset: 30,
                    child: Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '5-day Forecast',
                        style: TextStyle(
                            fontSize: 20,
                            color: AppColors.fontColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 220,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.list?.length ?? 0,
                        itemBuilder: (context, index) {
                          if (index % 8 == 4) {
                            return DayItem(
                              index: index,
                              element: snapshot.data!.list![index],
                              positionNum: _positionNum++,
                              isFirst:
                                  (index == snapshot.data!.list!.length - 4),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        }),
                  )
                ],
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
