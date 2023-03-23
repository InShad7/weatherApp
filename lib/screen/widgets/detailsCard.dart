import 'package:flutter/material.dart';
import 'package:weatherapp/screen/widgets/detailsRow.dart';
import 'package:weatherapp/utils/utils.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 225,
        decoration: BoxDecoration(
          border: Border.all(color: whiteOp2(), width: 1.5),
          gradient: LinearGradient(
            colors: [whiteOp2(), whiteOp2()],
            // stops: const [1.0, 1.0],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailsRow(
                title: 'Precipitation',
                data: 'data',
                title2: 'wind',
                data2: 'wind data',
                title3: 'uv',
                data3: 'uv data',
              ),
              DetailsRow(
                title: 'Pressure',
                data: 'data',
                title2: 'Visibility',
                data2: 'wind data',
                title3: 'HUM',
                data3: 'uv data',
              ),
              DetailsRow(
                  title: 'NNw Wind',
                  data: 'data',
                  title2: 'UV',
                  data2: 'wind data',
                  title3: 'uv',
                  data3: 'uv data'),
            ],
          ),
        ),
      ),
    );
  }
}
