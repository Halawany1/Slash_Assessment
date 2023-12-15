import 'dart:math';

import 'package:flutter/material.dart';
import 'package:slash_task/core/shared/crousel_card_component.dart';

///carouse view for shape of card product
class BuildCarouselView extends StatelessWidget {
  final PageController pageController;
  final int index;
  final String image;
  const BuildCarouselView({super.key,
    required this.pageController,
  required this.image,
  required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 0.0;
        if (pageController.position.haveDimensions) {
          value = index.toDouble() - (pageController.page ?? 0);
          value = (value * 0.1).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: pi * value,
          child: BuildCarouselCard( image: image,),
        );
      },
    );
  }
}
