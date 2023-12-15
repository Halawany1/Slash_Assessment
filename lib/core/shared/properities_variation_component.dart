import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/constant/constant.dart';

///properities variation like different size or material
class BuildProperitiesVariation extends StatelessWidget {
  final String text;
  final bool selected;
  const BuildProperitiesVariation({super.key,required this.text,required this.selected});

  @override
  Widget build(BuildContext context) {
    TextTheme font=Theme.of(context).textTheme;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 12.w),
      decoration: BoxDecoration(
          color: selected?ColorConstance.selectedColor:ColorConstance.unselectedColor,
          borderRadius: BorderRadius.circular(10.r)
      ),
      child: Text(text,
        style:font.bodySmall!.copyWith(fontSize: 14.sp,
          fontWeight: FontWeight.w800,
          color: selected?Colors.black:null
        ) ,),
    );
  }
}
