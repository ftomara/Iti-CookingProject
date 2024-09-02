import 'package:cooking_app/features/home/ui/widgets/biteguide_widget.dart';
import 'package:flutter/material.dart';

class BiteguidePage extends StatelessWidget {
  const BiteguidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: BiteguideWidget()),);
  }
}
