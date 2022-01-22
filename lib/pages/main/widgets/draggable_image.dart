import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../../utils/constants/colors.dart';

class DraggableImage extends StatelessWidget {
  final double opacity;
  final double imageHeight;
  final double imageWidth;
  final Uint8List? imageData;

  DraggableImage({
    required this.opacity,
    required this.imageHeight,
    required this.imageWidth,
    this.imageData,
  });

  @override
  Widget build(BuildContext context) {
    return imageData != null
        ? Opacity(
            opacity: opacity,
            child: Container(
              child: AnimatedSize(
                duration: Duration(milliseconds: 2500),
                curve: Curves.linearToEaseOut,
                child: Container(
                  height: imageHeight,
                  width: imageWidth,
                  child: Container(
                    child: PhotoViewGallery.builder(
                      gaplessPlayback: true,
                      customSize: Size(imageWidth, imageHeight),
                      allowImplicitScrolling: true,
                      backgroundDecoration: BoxDecoration(),
                      enableRotation: true,
                      scrollPhysics: const BouncingScrollPhysics(),
                      builder: (BuildContext context, int index) {
                        return PhotoViewGalleryPageOptions(
                          imageProvider: MemoryImage(imageData!),
                          initialScale: PhotoViewComputedScale.contained,
                        );
                      },
                      itemCount: 1,
                      loadingBuilder: (context, event) => Center(
                        child: Container(
                          width: 20.0,
                          height: 20.0,
                          child: SpinKitDualRing(
                            color: AppColors.SECONDARY,
                            size: 180.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : SizedBox();
  }
}
