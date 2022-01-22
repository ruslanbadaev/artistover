import 'package:camerawesome/camerapreview.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/models/orientations.dart';
import 'package:filling_slider/filling_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/images.dart';
import '../../utils/constants/links.dart';
import '../../utils/constants/strings.dart';
import '../../utils/url_launcher.dart';
import 'controller.dart';
import 'widgets/draggable_image.dart';
import 'widgets/link_button.dart';
import 'widgets/manual_button.dart';

class Main extends StatefulWidget {
  Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> with TickerProviderStateMixin {
  ValueNotifier<Sensors> _sensor = ValueNotifier(Sensors.BACK);
  ValueNotifier<Size> _photoSize = ValueNotifier(Size(1, 1));

  double _imageWidth = 10;
  double _imageHeight = 10;

  ValueNotifier<double>? _zoomNotifier = ValueNotifier(1);

  initState() {
    super.initState();
  }

  _animateImage() async {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _imageWidth = MediaQuery.of(context).size.width;
        _imageHeight = MediaQuery.of(context).size.height;
      });
    });
    setState(() {});
  }

  int? x;
  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;

    return GetBuilder<MainController>(
      init: MainController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.LIGHT,
          body: Stack(
            children: [
              SizedBox(
                width: _screenWidth,
                height: _screenHeight,
                child: CameraAwesome(
                  testMode: false,
                  onPermissionsResult: (bool? result) {},
                  selectDefaultSize: (List<Size> availableSizes) => Size(1920, 1080),
                  onOrientationChanged: (CameraOrientations? newOrientation) {},
                  zoom: _zoomNotifier,
                  sensor: _sensor,
                  photoSize: _photoSize,
                  captureMode: ValueNotifier(CaptureModes.PHOTO),
                  orientation: DeviceOrientation.portraitUp,
                  fitted: true,
                ),
              ),
              if (controller.isShowManual)
                Opacity(
                  opacity: .8,
                  child: Image.asset(
                    AppImages.MANUAL,
                    fit: BoxFit.cover,
                  ),
                ),
              DraggableImage(
                opacity: controller.opacity,
                imageHeight: _imageHeight,
                imageWidth: _imageWidth,
                imageData: controller.imageData,
              ),
              ManualButton(
                action: controller.toggleManual,
                isShowManual: controller.isShowManual,
              ),
            ],
          ),
          bottomSheet: SolidBottomSheet(
            toggleVisibilityOnTap: true,
            autoSwiped: false,
            maxHeight: _screenHeight * 0.7,
            headerBar: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    AppColors.PRIMARY.withOpacity(.8),
                    AppColors.PRIMARY.withOpacity(.8),
                    AppColors.SECONDARY.withOpacity(.8),
                  ],
                ),
              ),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Icon(
                      Icons.keyboard_arrow_up_rounded,
                      color: AppColors.WHITE,
                    ),
                  ),
                  Text(
                    AppStrings.APP_NAME,
                    style: TextStyle(
                      color: AppColors.WHITE,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: 28,
                  ),
                ],
              ),
            ),
            body: Container(
              color: AppColors.WHITE,
              height: 30,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 25),
                    Text(
                      AppStrings.OPTIONS,
                      style: TextStyle(color: AppColors.PRIMARY, fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 25),
                    if (controller.imageData != null)
                      FillingSlider(
                        color: AppColors.PRIMARY.withOpacity(.7),
                        fillColor: AppColors.SECONDARY.withOpacity(.7),
                        child: Icon(
                          Icons.blur_linear_rounded,
                          color: AppColors.WHITE,
                        ),
                        initialValue: controller.opacity,
                        onChange: (double x, double y) => {
                          controller.setOpacity = x,
                        },
                        width: _screenWidth - 60,
                        height: 50,
                        direction: FillingSliderDirection.horizontal,
                      ),
                    if (controller.imageData != null) SizedBox(height: 25),
                    FillingSlider(
                      color: AppColors.PRIMARY.withOpacity(.7),
                      fillColor: AppColors.SECONDARY.withOpacity(.7),
                      initialValue: _zoomNotifier!.value,
                      child: Icon(
                        Icons.zoom_in_rounded,
                        color: AppColors.WHITE,
                      ),
                      onChange: (x, y) => {
                        _zoomNotifier?.value = x,
                      },
                      width: _screenWidth - 60,
                      height: 50,
                      direction: FillingSliderDirection.horizontal,
                    ),
                    SizedBox(height: 25),
                    Text(
                      AppStrings.ABOUT_ME,
                      style: TextStyle(color: AppColors.SECONDARY, fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 25),
                    LinkButton(
                      title: AppStrings.MY_GITHUB,
                      width: _screenWidth - 60,
                      height: 50,
                      onTap: () => UrlLauncher.goTo(AppLinks.MY_GITHUB),
                      icon: Icon(
                        Icons.computer_rounded,
                        color: AppColors.WHITE,
                      ),
                      gradientColors: [
                        AppColors.PRIMARY.withOpacity(.8),
                        AppColors.PRIMARY.withOpacity(.8),
                        AppColors.SECONDARY.withOpacity(.8),
                      ],
                    ),
                    SizedBox(height: 25),
                    LinkButton(
                      title: AppStrings.MY_TIKTOK,
                      width: _screenWidth - 60,
                      height: 50,
                      onTap: () => UrlLauncher.goTo(AppLinks.MY_TIKTOK),
                      icon: Icon(
                        Icons.video_call_rounded,
                        color: AppColors.WHITE,
                      ),
                      gradientColors: [
                        AppColors.PRIMARY.withOpacity(.7),
                        AppColors.SECONDARY.withOpacity(.8),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.photo_library_rounded,
              color: AppColors.PRIMARY,
            ),
            onPressed: () => {
              controller.loadImage(),
              _animateImage(),
            },
          ),
        );
      },
    );
  }
}
