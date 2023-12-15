import 'dart:math';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/controller/details_item_cubit.dart';
import 'package:slash_task/core/constant/constant.dart';
import 'package:slash_task/core/dummy_data.dart';
import 'package:slash_task/core/shared/bottom_sheet_component.dart';
import 'package:slash_task/core/shared/card_image_component.dart';
import 'package:slash_task/core/shared/color_properties_component.dart';
import 'package:slash_task/core/shared/crousel_view_component.dart';
import 'package:slash_task/core/shared/list_view_item_component.dart';
import 'package:slash_task/core/shared/properities_variation_component.dart';
import 'package:slash_task/core/shared/quantity_component.dart';

/// for show all details about specific product
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme font = Theme.of(context).textTheme;
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    int currentPage = 0;
    var pageController = PageController(initialPage: currentPage, viewportFraction: 0.8);

    return BlocConsumer<DetailsItemCubit, DetailsItemState>(
      builder: (context, state) {
        var cubit = context.read<DetailsItemCubit>();
        return Scaffold(
          //bottom Sheet for add to cart
          bottomSheet: const BuildBottomSheet(textButton:
          'Add to Cart'),

          // app bar
          appBar: AppBar(
              leading: const Icon(Icons.arrow_back_ios),
              centerTitle: true,
              title: Text(
                'Product details',
                style: font.bodySmall!.copyWith(fontWeight: FontWeight.bold),
              )),

          //body
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 250.h,
                    child: PageView.builder(
                        onPageChanged: (value) {
                          cubit.changeIndexImage(value);
                        },
                        itemCount: product.variations[cubit.colorSelected]
                            .productVariantImages.length,
                        physics: const ClampingScrollPhysics(),
                        controller: pageController,
                        itemBuilder: (context, index) {
                          return BuildCarouselView(
                              pageController: pageController,
                              image: product.variations[cubit.colorSelected]
                                  .productVariantImages[index],
                              index: index);
                        }),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BuildListViewItem(
                      pageController: pageController,
                      images: product.variations[cubit.colorSelected]
                          .productVariantImages),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                product.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: font.bodySmall!.copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: 60.w,
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 60.w,
                                  height: 60.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(30.r)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30.r),
                                    child: Image.network(
                                      fit: BoxFit.cover,
                                      product.brandLogoUrl!,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(product.brandName!,
                                    style: font.bodySmall!.copyWith(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w300))
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'Selected Color',
                          style: font.bodySmall!.copyWith(
                              fontSize: 15.sp, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        SizedBox(
                          height: 24.h,
                          child: Center(
                            child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      cubit.changeIndexColor(index);
                                    },
                                    child: BuildColorPropereties(
                                      color: product.availableProperties[0]
                                          .propertyValues[index],
                                      selectedColor:
                                          cubit.colorSelected == index
                                              ? true
                                              : false,
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                      width: 10.w,
                                    ),
                                itemCount: product.availableProperties[0]
                                    .propertyValues.length),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Selected Size',
                              style: font.bodySmall!.copyWith(
                                  fontSize: 15.sp, fontWeight: FontWeight.w300),
                            ),
                            const Spacer(),
                            Text(
                              'Size Chart',
                              style: font.bodySmall!.copyWith(
                                  fontSize: 15.sp, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        SizedBox(
                          height: 45.h,
                          child: Center(
                            child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      cubit.changeIndexSize(index);
                                    },
                                    child: BuildProperitiesVariation(
                                        selected: cubit.sizeSelected == index
                                            ? true
                                            : false,
                                        text: product.availableProperties[1]
                                            .propertyValues[index]),
                                  );
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                      width: 5.w,
                                    ),
                                itemCount: product.availableProperties[1]
                                    .propertyValues.length),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'Selected Material',
                          style: font.bodySmall!.copyWith(
                              fontSize: 15.sp, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        SizedBox(
                          height: 45.h,
                          child: Center(
                            child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      cubit.changeIndexMaterial(index);
                                    },
                                    child: BuildProperitiesVariation(
                                        selected:
                                            cubit.materialSelected == index
                                                ? true
                                                : false,
                                        text: product.availableProperties[2]
                                            .propertyValues[index]),
                                  );
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                      width: 5.w,
                                    ),
                                itemCount: product.availableProperties[2]
                                    .propertyValues.length),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'Description Product',
                          style: font.bodySmall!.copyWith(fontSize: 15.sp),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        ExpandableText(
                          product.description,
                          style: font.bodySmall!.copyWith(
                              fontSize: 12.sp,
                              color: Colors.white.withOpacity(0.7)),
                          expandText: 'See More',
                          collapseText: 'See Less',
                          maxLines: 3,
                          linkColor: ColorConstance
                              .selectedColor, // Customize link color if needed
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        const BuildQuantity(black: false),
                        SizedBox(
                          height: 60.h,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
