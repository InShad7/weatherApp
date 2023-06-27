import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:weatherapp/controller/controller.dart';
import 'package:weatherapp/controller/home_controller/home_controller_bloc.dart';
import 'package:weatherapp/screen/widgets/custom_app_bar.dart';
import 'package:weatherapp/screen/widgets/detailsCard.dart';
import 'package:weatherapp/screen/widgets/iconData.dart';
import 'package:weatherapp/screen/widgets/mainCard.dart';
import 'package:weatherapp/screen/widgets/middleCard.dart';
import 'package:weatherapp/screen/widgets/searchField.dart';
import 'package:weatherapp/utils/utils.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    getData(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeControllerBloc>(context).add(InitialWeather());
    });

    mheight = MediaQuery.of(context).size.height;
    mwidth = MediaQuery.of(context).size.width;

    return BlocBuilder<HomeControllerBloc, HomeControllerState>(
      builder: (context, state) {
        late String mdate = state.weatherData.localTime;
        return Scaffold(
          backgroundColor: night,
          appBar: const CustomAppBar(),
          body: (state.weatherData.name == 'Null' ||
                  state.weatherData.name.isEmpty)
              ? Center(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: LoadingIndicator(
                      indicatorType: Indicator.circleStrokeSpin,
                      colors: [white],
                      strokeWidth: 2,
                    ),
                  ),
                )
              : Container(
                  color: state.weatherData.isDay == 1 ? blue : night,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SearchField(),
                      MainCard(
                        location:
                            '${state.weatherData.name.toString()}, ${state.weatherData.region}',
                        condition: state.weatherData.condition.toString(),
                        country: state.weatherData.country.toString(),
                        date: mdate,
                        img: state.weatherData.condition,
                        tempC: state.weatherData.tempeC,
                        isDay: state.weatherData.isDay == 1 ? 'DAY' : 'Night',
                        myIcon: getIcon(state.weatherData.condition),
                      ),
                      MiddleCard(
                        heading: 'WIND | HUMIDITY | CLOUD',
                        icon1: Icons.air,
                        title1: state.weatherData.windKph.toString(),
                        icon2: Icons.water_drop_outlined,
                        title2: state.weatherData.humidity.toString(),
                        icon3: Icons.cloud_outlined,
                        title3: state.weatherData.cloud.toString(),
                      ),
                      MiddleCard(
                        heading: 'SUNRISE & SUNSET',
                        icon1: Icons.wb_sunny_outlined,
                        title1: '6:27 AM',
                        icon2: Icons.schedule,
                        title2: mdate,
                        icon3: Icons.nights_stay,
                        title3: '6:35 PM',
                      ),
                      DetailsCard(
                        precipitation: state.weatherData.precipitation,
                        wind: state.weatherData.windDirection,
                        pressure: state.weatherData.pressure,
                        uv: state.weatherData.uv,
                        visibility: state.weatherData.visibility,
                        lastUpdate: lastUpdate,
                      ),
                      kheight20,
                    ],
                  ),
                ),
        );
      },
    );
  }
}
