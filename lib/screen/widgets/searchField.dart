import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/controller/controller.dart';
import 'package:weatherapp/controller/home_controller/home_controller_bloc.dart';
import 'package:weatherapp/utils/utils.dart';

class SearchField extends StatelessWidget {
  SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: mheight! / 22,
            width: mwidth! / 1.4,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: textController,
                cursorColor: grey,
                style: TextStyle(
                  color: grey,
                ),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(5),
                  hintText: 'Search by Location . . .',
                  icon: Icon(
                    Icons.search_rounded,
                    size: mheight! / 37,
                  ),
                  hintStyle: TextStyle(
                    fontSize: mheight! / 54,
                    color: grey,
                  ),
                ),
              ),
            ),
          ),
          BlocBuilder<HomeControllerBloc, HomeControllerState>(
            builder: (context, state) {
              return SizedBox(
                height: mheight! / 22,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          state.weatherData.isDay == 1 ? night : blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (textController.text.isNotEmpty) {
                        debouncer.run(() {
                          // await Future.delayed(const Duration(seconds: 3));
                          BlocProvider.of<HomeControllerBloc>(context).add(
                              SearchUpdate(val: textController.text.trim()));
                          getData(context);
                        });
                      } else {
                        getData(context);
                      }
                    },
                    child: const Text('search')),
              );
            },
          )
        ],
      ),
    );
  }
}
