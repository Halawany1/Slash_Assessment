import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/controller/details_item_cubit.dart';
import 'package:slash_task/core/shared/card_image_component.dart';

/// small card for show all card images for product
class BuildListViewItem extends StatelessWidget {
  final PageController pageController;
  final List<String> images;
  const BuildListViewItem({super.key,required this.pageController,required this.images});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsItemCubit,DetailsItemState>(
       builder: (context, state) {
         var cubit=context.read<DetailsItemCubit>();
         return SizedBox(
           height: 45.w,
           child: ListView.separated(
             shrinkWrap: true,
             scrollDirection: Axis.horizontal,
             physics: const BouncingScrollPhysics(),
             itemBuilder: (context, index) => GestureDetector(
               onTap: () {
                 cubit.changeIndexImage(index);
                 pageController.animateToPage(index,
                     duration:const Duration(seconds:1),
                     curve: Curves.fastOutSlowIn);
               },
               child: BuildCardImageComponent(
                 selected: cubit.currentIndex == index ? true : false,
                 borderRadius: 10,
                 i: images[index],
                 height: 45.w,
                 width: 45.w,
               ),
             ),
             separatorBuilder: (context, index) => SizedBox(width: 10.w),
             itemCount: images.length,
           ),
         );
       },
      listener: (context, state) {

      },

    );
  }
}
