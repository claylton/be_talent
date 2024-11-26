import 'package:be_talent/view/resources/colors.dart';
import 'package:flutter/material.dart';

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
          const Icon(
            Icons.notifications_none_outlined,
            size: 32,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.bluePrimary,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  number.toString(),
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
