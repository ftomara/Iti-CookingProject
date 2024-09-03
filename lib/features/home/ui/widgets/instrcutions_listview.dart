import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstrcutionsListview extends StatefulWidget {
  const InstrcutionsListview({super.key, required this.contentList});

  final List<String> contentList;

  @override
  State<InstrcutionsListview> createState() => _InstrcutionsListviewState();
}

class _InstrcutionsListviewState extends State<InstrcutionsListview> {
  late List<bool> _checked;

  @override
  void initState() {
    super.initState();
    _checked = List<bool>.filled(widget.contentList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.contentList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.1),
            child: CheckboxListTile(
              title: Text(
                widget.contentList[index],
                style: GoogleFonts.oswald(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xFF333333),
                  decoration: _checked[index]
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              value: _checked[index],
              onChanged: (value) {
                setState(() {
                  _checked[index] = value ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              checkboxShape: const CircleBorder(),
              contentPadding: const EdgeInsets.only(
                right: 18,
              ),
              activeColor: const Color(0xFF333333),
              checkColor: const Color(0xFFFCF6E0),
              visualDensity: const VisualDensity(horizontal: -4.0),
            ),
          );
        },
      ),
    );
  }
}
