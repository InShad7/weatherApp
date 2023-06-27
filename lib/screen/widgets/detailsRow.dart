import 'package:flutter/material.dart';
import 'package:weatherapp/controller/controller.dart';
import 'package:weatherapp/utils/utils.dart';

class DetailsRow extends StatelessWidget {
  String title, title2, title3;
  String data, data2, data3;

  DetailsRow({
    super.key,
    required this.title,
    required this.data,
    required this.title2,
    required this.data2,
    required this.title3,
    required this.data3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(color: white70, fontSize: mheight! / 65),
              ),
              Text(
                title2,
                style: TextStyle(color: white70, fontSize: mheight! / 65),
              ),
            ],
          ),
          kheight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data,
                style: TextStyle(color: white, fontSize: mheight! / 65),
              ),
              Padding(
                padding: EdgeInsets.only(left: mwidth! / 2.01),
                child: Text(
                  data2,
                  style: TextStyle(color: white, fontSize: mheight! / 65),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
