
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/controller/controller.dart';
import 'package:weatherapp/controller/home_controller/home_controller_bloc.dart';
import 'package:weatherapp/utils/utils.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({super.key});
  final Size preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeControllerBloc, HomeControllerState>(
      builder: (context, state) {
        return AppBar(
          elevation: 0,
          title: Text(
            'Today\'s Weather',
            style: TextStyle(fontSize: mheight! / 38),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async {
                log(textController.text);
                textController.clear();
                await getData(context);
              },
              icon: Icon(
                Icons.refresh_rounded,
                size: mheight! / 33,
              ),
            )
          ],
          backgroundColor: state.weatherData.isDay == 1 ? blue : night,
        );
      },
    );
  }
}
