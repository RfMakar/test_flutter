base class Car {
  final String brand;
  final int _speed;
  final double _prise;
  final String image;

  Car(
    this.brand,
    this._speed,
    this._prise,
    this.image,
  );

  String get prise => '$_prise Pуб';

  String get speed => '$_speed км/ч';


}
