import 'package:flutter/material.dart';

import '../../../../product/constants/app_dimensions.dart';

Widget cardInfo(BuildContext context, {String? title, String? description}) {
  return Padding(
    padding: AppDimensions.paddingHorizontal8,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? '',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          description ?? '',
          style: Theme.of(context).textTheme.titleMedium,
        )
      ],
    ),
  );
}
