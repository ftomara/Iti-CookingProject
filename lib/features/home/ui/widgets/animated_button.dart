import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween<double>(begin: 1.0, end: 1.2).animate(_animationController),
      child: IconButton(
          onPressed: () {
            widget.pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          },
          icon: SvgPicture.asset(
            'assets/images/play_button.svg',
          )),
    );
  }
}
