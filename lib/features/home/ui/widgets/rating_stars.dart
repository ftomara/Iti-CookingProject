import 'package:flutter/material.dart';

class RatingStars extends StatefulWidget {
  const RatingStars({super.key});

  @override
  State<RatingStars> createState() => _RatingStarsState();
}

class _RatingStarsState extends State<RatingStars> {
  int _rating = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: () {
            setState(() {
              _rating = index;
            });
          },
          icon: Icon(
            index > _rating ? Icons.star_border : Icons.star,
            color: index > _rating
                ? const Color(0xFF333333)
                : const Color(0xFFF96635),
            size: 32,
          ),
        );
      }),
    );
  }
}
