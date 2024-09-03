import 'package:cooking_app/features/home/ui/widgets/on_boarding_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: OnBoardingWidget()),
    );
  }
}
