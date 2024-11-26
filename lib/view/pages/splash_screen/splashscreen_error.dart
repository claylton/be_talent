import 'package:be_talent/view/resources/assets_path.dart';
import 'package:be_talent/view/resources/colors.dart';
import 'package:flutter/material.dart';

class SplashscreenError extends StatelessWidget {
  final Future<void> Function() reloadData;
  const SplashscreenError({super.key, required this.reloadData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetsPath.logo),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Algo de errado aconteceu. Tente novamente!',
            style: TextStyle(
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => reloadData(),
            child: const Icon(
              Icons.refresh,
              size: 40,
              color: AppColors.white,
            ),
          )
        ],
      ),
    );
  }
}
