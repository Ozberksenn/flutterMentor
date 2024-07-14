import 'package:flutter/material.dart';
import 'package:fluttermentor/features/model/all_characterse.dart';
import 'package:fluttermentor/product/constants/app_dimensions.dart';
import 'package:fluttermentor/product/constants/app_strings.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    this.title,
    this.list,
  });

  final String? title;
  final List<AllCharacters>? list;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: height / 3,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: list!.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: width / 2.6,
                    margin: const EdgeInsets.all(4.0),
                    child: Column(children: [
                      Container(
                        height: height / 3.8,
                        decoration: BoxDecoration(
                            borderRadius: AppDimensions.radius16,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: list?[index].image != ""
                                    ? NetworkImage(list?[index].image ??
                                        AppStrings.customImage)
                                    : const NetworkImage(
                                        AppStrings.customImage))),
                      ),
                      SizedBox(
                        width: width / 3,
                        child: Text(
                          list?[index].name ?? "",
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ]),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
