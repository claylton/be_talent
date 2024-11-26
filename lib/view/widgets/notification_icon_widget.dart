import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationIconWidget extends StatelessWidget {
  final int number;
  const NotificationIconWidget({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 37,
      height: 37,
      child: Stack(
        children: [
          SvgPicture.asset(
            'assets/icons/bell-notification.svg', // Caminho para o seu arquivo SVG
            width: 32,
            height: 32,
          ),
        ],
      ),
    );
  }
}
