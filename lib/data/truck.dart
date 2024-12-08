import 'package:test_flutter/data/car.dart';
import 'package:test_flutter/data/parameters_car.dart';

//Грузовая
final class TruckCar extends Car implements ParametersCar {
  TruckCar(
    super.brand,
    super._speed,
    super._prise,
    super.image,
    this.height,
    this.width,
    this.length,
  );


  @override
  double height;
  @override
  double width;
  @override
  double length;

  @override
  String heightToString() {
    return 'Высота ${super.brand} равна $height мм';
  }

  @override
  String lengthToString() {
    return 'Длина ${super.brand} равна $height мм';
  }

  @override
  String widthToString() {
    return 'Ширина ${super.brand} равна $height мм';
  }
}
