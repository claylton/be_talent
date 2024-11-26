import 'package:be_talent/view/widgets/avatar_widget.dart';
import 'package:be_talent/view/widgets/notification_icon_widget.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: true,
      child: SizedBox(
        height: 79,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: AvatarTextWidget(text: 'CG'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: NotificationIconWidget(number: 2),
            )
          ],
        ),
      ),
    );
  }
}
