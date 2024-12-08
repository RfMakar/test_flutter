import 'package:flutter/material.dart';
import 'package:test_flutter/data/car.dart';
import 'package:test_flutter/data/lists.dart';
import 'package:test_flutter/presentation/bottom_sheets/info_car.dart';
import 'package:test_flutter/presentation/screens/car.dart';

/*
GridView, Images
FutureBuilder
StatelessWidget, StatefulWidget
Navigation
*/

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final list = <Car>[...passengesCars, ...trucksCars];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Car'),
        backgroundColor: Colors.amber,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            // mainAxisExtent: 1,
            crossAxisCount: 2,
            childAspectRatio: 0.8),
        itemCount: list.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return CardCar(
            car: list[index],
          );
        },
      ),
    );
  }
}

class CardCar extends StatelessWidget {
  const CardCar({super.key, required this.car});
  final Car car;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/car', arguments: car);
        },
        onDoubleTap: () {
          showModalBottomSheet(
            showDragHandle: true,
            backgroundColor: Colors.amber,
            context: context,
            builder: (context) {
              return InfoCar(car: car,);
            },
          );
        },
        onLongPress: () {
          showAboutDialog(
            context: context,
            
          );
        },
        child: Column(
          children: [
            Text(car.brand),
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  car.image,
                  height: 180,
                  fit: BoxFit.fitHeight,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                )),
          ],
        ),
      ),
    );
  }
}
