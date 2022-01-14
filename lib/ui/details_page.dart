import 'package:flutter/material.dart';
import 'package:weather/bloc/weather_bloc.dart';
import 'package:weather/helper/utils.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/ui/items/hourItem.dart';
import 'package:weather/ui/widgets/helper_widget.dart';

class DetailsPage extends StatefulWidget {
  int index;

  DetailsPage(this.index, {Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var _positionNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Weather>(
          stream: weatherBloc.weather,
          builder: (context, AsyncSnapshot<Weather> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  helperWidget.weatherDay(
                      cityName: snapshot.data!.city!.name,
                      date: utils.format(
                          'E D/M/y',
                          snapshot.data!.list![widget.index].dtTxt ??
                              DateTime.now()),
                      weatherState: snapshot
                          .data!.list![widget.index].weather!.first.main,
                      tempMinMax:
                          '${snapshot.data!.list![widget.index].main!.tempMax.toInt()}/${snapshot.data!.list![widget.index].main!.tempMin.toInt()}\u00B0',
                      iconPath: helperWidget.imagePath[snapshot
                          .data!.list![widget.index].weather!.first.icon],
                      temp: snapshot.data!.list![widget.index].main!.temp
                          .toInt()
                          .toString(),
                      index: widget.index),
                  Container(
                    height: (snapshot.data?.list?.length ?? 0) * 12,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.list?.length ?? 0,
                        itemBuilder: (context, index) {
                          if (snapshot.data!.list![widget.index].dtTxt!.day ==
                              snapshot.data!.list![index].dtTxt!.day) {
                            return HourItem(
                              index: index,
                              element: snapshot.data!.list![index],
                              positionNum: _positionNum++,
                            );
                          }
                          return const SizedBox.shrink();
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
