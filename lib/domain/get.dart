import 'package:test_flutter/data/car.dart';
import 'package:test_flutter/data/lists.dart';

Future<List<Car>> getCars()async{
  //имитация загрузки
  await Future.delayed(const Duration(seconds: 5));
  return <Car>[...passengesCars, ...trucksCars];
}