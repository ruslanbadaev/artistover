import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller.dart';

class MainController extends GetxController {
  AppController appController = Get.find();
  var _isShowManual = false;
  var _imageData;
  var _opacity = .5;
  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  bool get isShowManual => _isShowManual;
  Uint8List? get imageData => _imageData;
  double get opacity => _opacity;
  XFile? get image => _image;

  set setOpacity(double opacity) {
    _opacity = opacity;
    update();
  }

  set setImageData(Uint8List? data) {
    _imageData = data;
  }

  Future<Uint8List?> readImage() async {
    return await _image?.readAsBytes();
  }

  void toggleManual() {
    _isShowManual = !_isShowManual;
    update();
  }

  Future<void> openGallery() async {
    _image = await _picker.pickImage(source: ImageSource.gallery);
    update();
  }

  void loadImage() async {
    await openGallery();
    setImageData = await readImage();
    update();
  }
}
