import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/controller/home_controller/home_controller_bloc.dart';
import 'package:weatherapp/screen/home.dart';
import 'package:weatherapp/screen/widgets/debouncer.dart';
import 'package:weatherapp/utils/utils.dart';

TextEditingController textController = TextEditingController();

class SearchField extends StatelessWidget {
  var weatherFun;

  SearchField({super.key, required this.weatherFun});

  final _debouncer = Debouncer(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    //  WidgetsBinding.instance.addPostFrameCallback((_) {
    //   BlocProvider.of<HomeControllerBloc>(context).add(InitialSearch());
    // });
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: mheight! / 22,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: white(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: textController,
            cursorColor: grey(),
            style: TextStyle(
              color: grey(),
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
                color: grey(),
              ),
            ),
            onChanged: (value) {
              // setState(() {

              _debouncer.run(() {
                // await Future.delayed(const Duration(seconds: 3));
                BlocProvider.of<HomeControllerBloc>(context)
                    .add(SearchUpdate(val: value));
                weatherFun;
              });
              // });
              // weatherFun;
            },
          ),
        ),
      ),
    );
  }
}
