import 'package:flutter/material.dart';
import 'package:mvvm/presentation/resources/color_manager.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkPrimary,
      body: const Center(
        child: Text('OnBoarding View'),
      ),
    );
  }
}
