import 'package:flutter/material.dart';
import 'package:test_flutter/data/car.dart';

class CarScreen extends StatelessWidget {
  const CarScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final car = ModalRoute.of(context)!.settings.arguments as Car;
    return Scaffold(
      appBar: AppBar(
        title: Text(car.brand),
      ),
      body: BodyCar(car: car),
    );
  }
}

class BodyCar extends StatelessWidget {
  const BodyCar({super.key, required this.car});
  final Car car;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            car.image,
          ),
        ),
        const Like(),
      ],
    );
  }
}

class Like extends StatefulWidget {
  const Like({super.key});

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  int likeCount = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StatefulBuilder(
          builder: (context, setState) {
            return Row(
              children: [
                Text(
                  likeCount.toString(),
                ),
                IconButton(
                  onPressed: () {
                    setState(() => likeCount++);
                  },
                  icon: likeCount == 0
                      ? const Icon(Icons.favorite_outline)
                      : const Icon(Icons.favorite),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
