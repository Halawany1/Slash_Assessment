import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slash_task/controller/details_item_cubit.dart';
import 'package:slash_task/core/dummy_data.dart';
import 'package:slash_task/core/shared/bottom_sheet_component.dart';
import 'package:slash_task/core/shared/quantity_component.dart';

import '../core/constant/constant.dart';

/// cart screen contain on product that added for checkout
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme font = Theme.of(context).textTheme;
    return BlocConsumer<DetailsItemCubit, DetailsItemState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<DetailsItemCubit>();
        return Scaffold(
            //bottom sheet
            bottomSheet:
                const BuildBottomSheet(textButton: 'Proceed to Checkout'),
            //body
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(18.h),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.arrow_back_ios)),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text('My Cart', style: font.bodySmall),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      if (cubit.totalPrice != 0)
                        ListView.separated(
                          itemCount: 1,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => SizedBox(
                            height: 10.h,
                          ),
                          itemBuilder: (context, index) => Dismissible(
                              key: UniqueKey(),
                              background: Container(
                                color: Colors.red,
                                height: 150.h,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 28.w),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 50.w,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onDismissed: (direction) {
                                cubit.removeProduct();
                              },
                              child: Container(
                                width: double.infinity,
                                height: 120.h,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: ColorConstance.unselectedColor),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        child: Image.network(
                                          fit: BoxFit.cover,
                                          product
                                              .variations[cubit.colorSelected]
                                              .productVariantImages[0],
                                          width: 110.h,
                                          height: 150.h,
                                        )),
                                    SizedBox(
                                      width: 14.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.name,
                                          style: font.bodySmall!
                                              .copyWith(fontSize: 16.sp),
                                        ),
                                        Text(
                                          product.brandName!,
                                          style: font.bodySmall!.copyWith(
                                              color:
                                                  Colors.white.withOpacity(0.6),
                                              fontSize: 12.sp),
                                        ),
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                        const BuildQuantity(
                                          black: true,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        )
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
