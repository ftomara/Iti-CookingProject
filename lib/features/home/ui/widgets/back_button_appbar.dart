import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../my_colors.dart';

class BackButtonAppbar extends StatefulWidget {
  const BackButtonAppbar({super.key, this.title = ''});

  final String title;

  @override
  State<BackButtonAppbar> createState() => _BackButtonAppbarState();
}

class _BackButtonAppbarState extends State<BackButtonAppbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_rounded,
            color: MyColors.black,
            size: 36,
          ),
        ),
        const SizedBox(
          width: 14,
        ),
        if (widget.title != '')
          Text(
            widget.title,
            style: GoogleFonts.oswald(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: MyColors.black,
            ),
          ),
      ],
    );
  }
}
