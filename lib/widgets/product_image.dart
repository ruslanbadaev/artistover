import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final double padding;
  ProductImage(
    this.image, {
    required this.padding,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}
