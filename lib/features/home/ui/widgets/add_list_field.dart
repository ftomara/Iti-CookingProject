import 'package:flutter/material.dart';

import '../../../../core/themes/my_text_style.dart';
import '../../../../my_colors.dart';

class AddListField extends StatefulWidget {
  const AddListField({super.key, required this.hintText, required this.list});

  final String hintText;
  final List<String> list;

  @override
  State<AddListField> createState() => _AddListFieldState();
}

class _AddListFieldState extends State<AddListField> {
  final TextEditingController _controller = TextEditingController();
  // final List<String> _list = [];

  void _additem(String item) {
    setState(() {
      widget.list.add(item);
      _controller.clear();
    });
  }

  void _removeitem(int index) {
    setState(() {
      widget.list.removeAt(index);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: MyColors.greycolor, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: MyColors.greycolor, width: 2),
            ),
            hintText: widget.hintText,
          ),
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              _additem(value);
            }
          },
          style: MyTextStyle.input,
        ),
        const SizedBox(
          height: 8,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.list.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index) {
            final ingreadiant = widget.list[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: MyColors.black),
                ),
                title: Text(
                  ingreadiant,
                  style: MyTextStyle.input,
                ),
                trailing: IconButton(
                  onPressed: () => _removeitem(index),
                  icon: const Icon(Icons.delete),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
