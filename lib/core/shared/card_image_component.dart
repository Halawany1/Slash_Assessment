import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/constant/constant.dart';

class BuildCardImageComponent extends StatelessWidget {
  final String i;
  final double width;
  final double height;
  final double borderRadius;
  final bool selected;
  const BuildCardImageComponent(
      {
        super.key,
        required this.i,
        required this.selected,
        required this.borderRadius,
        required this.height,
        required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border:selected?
        Border.all(color: ColorConstance.selectedColor,width: 2.w):null,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius-2),
          child: Image.network(i, fit: BoxFit.cover)),
    );
  }
}
