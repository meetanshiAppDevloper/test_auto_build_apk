import 'package:flutter/material.dart';
import 'package:flutter_getx_structure/src/utils/dimensions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(Dimensions.radiusSmall)),
            alignment: Alignment.center,
            child: SpinKitCircle(
              color: Theme.of(context).primaryColor,
              size: 40.0,
            )));
  }
}

class CustomLoaderWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? containerBgColor;
  final Widget loader;
  const CustomLoaderWidget({
    super.key,
    this.height,
    this.width,
    this.containerBgColor,
    required this.loader,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: height,
            width: height,
            decoration: BoxDecoration(
                color: containerBgColor,
                borderRadius: BorderRadius.circular(Dimensions.radiusSmall)),
            alignment: Alignment.center,
            child: loader));
  }
}
