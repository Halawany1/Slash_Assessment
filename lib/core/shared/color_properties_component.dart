import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// color propereties is different color for product
class BuildColorPropereties extends StatelessWidget {
  final Color color;
  final bool selectedColor;
  const BuildColorPropereties({super.key,required this.color,required this.selectedColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shadowColor: Colors.white70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Container(height: 24.h,width: 24.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: color,
            border:selectedColor? Border.all(color: Colors.white,width: 2.w):null
        ),
      ),
    );
  }
}
