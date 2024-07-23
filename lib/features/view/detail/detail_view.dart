import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermentor/features/model/all_characterse.dart';
import 'package:fluttermentor/features/view/profile/widgets/detail_card_content.dart';
import 'package:fluttermentor/features/widgets/appBar.dart';

class DetailView extends StatelessWidget {
  final AllCharacters characters;
  const DetailView({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Column(
        children: [
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 48.0),
                  child: DetailCardContent(
                    image: characters.image,
                    title: characters.name,
                    className: characters.house,
                    animal: characters.patronus,
                    wand: characters.yearOfBirth.toString(),
                  )))
        ],
      ),
    );
  }
}
