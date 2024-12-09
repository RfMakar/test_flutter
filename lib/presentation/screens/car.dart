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
      backgroundColor: const Color.fromRGBO(36, 44, 59, 1),
      // appBar: AppBar(
      //   title: Text(car.brand),
      //   backgroundColor: Colors.white.withOpacity(0),
      // ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/bg1.png'),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 70, 0, 0),
                height: 70,
                color: Colors.amber,
              ),
              BodyCar(car: car),
            ],
          ),
        ],
      ),
    );
  }
}

class BodyCar extends StatelessWidget {
  const BodyCar({super.key, required this.car});
  final Car car;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
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
    return StatefulBuilder(
      builder: (context, setState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              likeCount.toString(),
              style: const TextStyle(color: Colors.red),
            ),
            IconButton(
              onPressed: () {
                setState(() => likeCount++);
              },
              icon: likeCount == 0
                  ? const Icon(
                      Icons.favorite_outline,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
            )
          ],
        );
      },
    );
  }
}
