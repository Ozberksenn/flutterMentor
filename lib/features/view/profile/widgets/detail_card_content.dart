import 'package:flutter/material.dart';

import '../../../../product/constants/app_colors.dart';
import '../../../../product/constants/app_dimensions.dart';
import 'card_info.dart';

class DetailCardContent extends StatelessWidget {
  const DetailCardContent({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimensions.pagePadding,
      child: Column(children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: AppDimensions.radius8, color: AppColors.black),
            padding: AppDimensions.padding8,
            child: Container(
              width: width,
              padding: AppDimensions.padding32,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 162, 149, 98),
                gradient: LinearGradient(begin: Alignment.topLeft, colors: [
                  AppColors.cardColor,
                  AppColors.cardColor.withOpacity(0.8),
                  AppColors.cardColor.withOpacity(0.6),
                ]),
                borderRadius: AppDimensions.radius8,
              ),
              child: Column(
                children: [
                  Text(
                    "Ministry of Magic".toUpperCase(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Padding(padding: AppDimensions.padding16),
                  Container(
                    padding: AppDimensions.padding8,
                    width: width,
                    height: height / 4,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: AppDimensions.radius8),
                  ),
                  const Padding(padding: AppDimensions.padding16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        cardInfo(context,
                            title: "Class", description: "Class Name"),
                        cardInfo(context,
                            title: "Animal", description: "Rabbit"),
                        cardInfo(context,
                            title: "Wand", description: "Wand Name"),
                        cardInfo(context,
                            title: "User", description: "Özberk Şen")
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
