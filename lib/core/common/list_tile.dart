import 'package:flutter/material.dart';
import 'package:pexa_carcare_test/core/common/variables.dart';
import 'package:pexa_carcare_test/theame/palette.dart';

class ListTileWidget extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final String subTitle;
  const ListTileWidget({super.key,
    required this.leadingIcon,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ListTile(
        tileColor: Colors.grey.shade50,
        contentPadding: EdgeInsets.only(left: w*0.03,right: w*0.03),
        leading: Icon(leadingIcon),
        title: Text(title),
        titleTextStyle: TextStyle(
            fontSize: w*0.04,
          color: Pallete.blackColor
        ),
        subtitle: Text(subTitle),
        subtitleTextStyle:  TextStyle(
            fontSize: w*0.03,
            color: Pallete.greyColor
        ),
        trailing:  Icon(Icons.arrow_forward_ios)
      ),
    );
  }
}