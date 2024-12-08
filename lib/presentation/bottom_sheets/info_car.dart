import 'package:flutter/material.dart';
import 'package:test_flutter/data/car.dart';

class InfoCar extends StatelessWidget {
  const InfoCar({super.key, required this.car});
  final Car car;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                car.brand,
                style: TextStyle(fontSize: 24),
              ),
            ),
            Text(car.prise),
            Text(car.speed),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Закрыть')),
            )
          ],
        ),
      ),
    );
  }
}
