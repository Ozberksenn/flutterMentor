import 'package:flutter/material.dart';

import '../../../../product/constants/app_colors.dart';
import '../../../../product/constants/app_dimensions.dart';
import 'card_info.dart';

class DetailCardContent extends StatelessWidget {
  const DetailCardContent(
      {super.key,
      this.title,
      this.image,
      this.className,
      this.animal,
      this.wand});

  final String? title;
  final String? image;
  final String? className;
  final String? animal;
  final String? wand;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
                    title?.toUpperCase() ?? "",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Padding(padding: AppDimensions.padding16),
                  Container(
                    padding: AppDimensions.padding8,
                    width: width,
                    height: height / 4,
                    decoration: BoxDecoration(
                        image: image != null && image != ""
                            ? DecorationImage(
                                fit: BoxFit.fill, image: NetworkImage(image!))
                            : null,
                        border: Border.all(width: 1),
                        borderRadius: AppDimensions.radius8),
                  ),
                  const Padding(padding: AppDimensions.padding16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        cardInfo(context,
                            title: "Class", description: className),
                        cardInfo(context, title: "Animal", description: animal),
                        cardInfo(context, title: "Year", description: wand),
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
