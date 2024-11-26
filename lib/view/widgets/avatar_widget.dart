import 'package:be_talent/view/resources/colors.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String url;
  const AvatarWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 17,
      backgroundImage: NetworkImage(url),
    );
  }
}

class AvatarTextWidget extends StatelessWidget {
  final String text;
  const AvatarTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 45 / 2,
      backgroundColor: AppColors.gray05,
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Helvetica',
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
