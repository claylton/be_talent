import 'package:be_talent/view/resources/assets_path.dart';
import 'package:be_talent/view/resources/colors.dart';
import 'package:flutter/material.dart';

class SplashscreenLoading extends StatelessWidget {
  const SplashscreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bluePrimary,
      body: Center(child: Image.asset(AssetsPath.logo)),
    );
  }
}
