import 'package:cooking_app/features/home/model/recipe.dart';
import 'package:cooking_app/features/home/model/recipe_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstrcutionsListview extends StatefulWidget {
  const InstrcutionsListview({
    super.key,
    this.recipe,
    this.recipefbs,
    required this.isIngredients,
  });

  final RecipeInfo? recipe;
  final Recipe? recipefbs;
  final bool isIngredients;

  @override
  State<InstrcutionsListview> createState() => _InstrcutionsListviewState();
}

class _InstrcutionsListviewState extends State<InstrcutionsListview> {
  late List<dynamic>? _items;
  late List<bool>? _checked;

  @override
  void initState() {
    super.initState();

    // if (widget.recipe != null) {
    _items = widget.recipe != null
        ? (widget.isIngredients
            ? (widget.recipe?.extendedIngredients ?? [])
            : (widget.recipe?.analyzedInstructions ?? [])
                .expand((instruction) => instruction.steps ?? [])
                .toList())
        : (widget.isIngredients
            ? widget.recipefbs?.ingreadiants ?? []
            : widget.recipefbs?.instructions ?? []);
    // } else if (widget.recipefbs != null) {
    //   _items =
    // } else {
    //   _items = [];
    // }

    _checked = List<bool>.filled(_items?.length ?? 0, false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _items?.length,
      itemBuilder: (context, index) {
        final item = _items?[index];
        final title = widget.recipe != null
            ? (widget.isIngredients
                ? item.amount != null || item.amount != ''
                    ? '${item.amount % 1 == 0 ? (item.amount).toInt() : item.amount} ${item.unit} ${item.name}'
                    : item.name
                : item.step)
            : item;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.1),
          child: CheckboxListTile(
            title: Text(
              title,
              style: GoogleFonts.oswald(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: const Color(0xFF333333),
                decoration: _checked?[index] ?? false
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            value: _checked?[index],
            onChanged: (value) {
              setState(() {
                _checked?[index] = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            checkboxShape: const CircleBorder(),
            contentPadding: const EdgeInsets.only(right: 18),
            activeColor: const Color(0xFF333333),
            checkColor: const Color(0xFFFCF6E0),
            visualDensity: const VisualDensity(horizontal: -4.0),
          ),
        );
      },
    );
  }
}
