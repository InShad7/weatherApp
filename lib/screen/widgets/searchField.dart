import 'package:flutter/material.dart';
import 'package:weatherapp/screen/widgets/debouncer.dart';
import 'package:weatherapp/utils/utils.dart';

TextEditingController textController = TextEditingController();

class SearchField extends StatefulWidget {
  var weatherFun;

  SearchField({super.key, required this.weatherFun});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _debouncer = Debouncer(milliseconds: 3000);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 44,
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
              icon: const Icon(Icons.search_rounded),
              hintStyle: TextStyle(
                fontSize: 18,
                color: grey(),
              ),
            ),
            
            onChanged: (value) {
              setState(() {
                 _debouncer.run(() {
                widget.weatherFun;
              });
              });
              // weatherFun;
             
            },
          ),
        ),
      ),
    );
  }
}
