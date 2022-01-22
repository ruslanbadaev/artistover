import 'package:get/get.dart';

class CategoryModel {
  CategoryModel({
    required final String key,
    required final String name,
    required final String color,
  }) {
    this.key;
    this.name = name;
    this.color = color;
  }

  RxString _key = RxString('');
  set key(String value) => _key.value = value;
  String get key => _key.value;

  RxString _name = RxString('');
  set name(String value) => _name.value = value;
  String get name => _name.value;

  RxString _color = RxString('');
  set color(String value) => _color.value = value;
  String get color => _color.value;
}
