import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/controller/details_item_cubit.dart';
import 'package:slash_task/core/constant/constant.dart';
import 'package:slash_task/core/dummy_data.dart';

/// to add or minus in quantity to product
class BuildQuantity extends StatelessWidget {
  final bool black;
  const BuildQuantity({super.key,required this.black});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<DetailsItemCubit,DetailsItemState>(
      builder: (context, state) {
        var cubit=context.read<DetailsItemCubit>();
        TextTheme font =Theme.of(context).textTheme;
       return Row(
          children: [
            Text(
              'Quantity',
              style: font.bodySmall!.copyWith(fontSize: 15.sp),
            ),
            SizedBox(
              width: 18.w,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  vertical: 5.h, horizontal: 5.w),
              decoration: BoxDecoration(
                  color: black?Colors.black:ColorConstance.unselectedColor,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        cubit.changeQuantity(
                            false,
                            (product
                                .variations[
                            cubit.colorSelected]
                                .price +
                                product
                                    .variations[
                                cubit.sizeSelected]
                                    .price +
                                product
                                    .variations[cubit
                                    .materialSelected]
                                    .price)
                                .toDouble());
                      },
                      child:const Icon(Icons.remove)),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    cubit.quantity.toString(),
                    style: font.bodySmall!
                        .copyWith(fontSize: 15.sp),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  InkWell(
                      onTap: () {
                        cubit.changeQuantity(
                            true,
                            (product
                                .variations[
                            cubit.colorSelected]
                                .price +
                                product
                                    .variations[
                                cubit.sizeSelected]
                                    .price +
                                product
                                    .variations[cubit
                                    .materialSelected]
                                    .price)
                                .toDouble());
                      },
                      child: const Icon(Icons.add)),
                ],
              ),
            )
          ],
        );
      },
      listener: (context, state) {

      },
    );
  }
}
