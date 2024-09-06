import 'package:cooking_app/core/di/module.dart';
import 'package:cooking_app/features/home/logic/item_cubit.dart';
import 'package:cooking_app/features/home/logic/recipe_cubit.dart';
import 'package:cooking_app/features/home/ui/widgets/catigories.dart';
import 'package:cooking_app/features/home/ui/widgets/nav_bar.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_card.dart';
import 'package:cooking_app/features/home/ui/widgets/recipe_card_gen.dart';
import 'package:cooking_app/features/home/ui/widgets/search.dart';
import 'package:cooking_app/features/home/ui/widgets/welcoming_bar.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ItemCubit, String>(
        listener: (context, itemState) {
          final searchTerm = context.read<ItemCubit>().searchItem;
          final category = context.read<ItemCubit>().category;

          if (searchTerm.isNotEmpty) {
            context.read<RecipeCubit>().emitState(searchTerm);
          } else {
            controller.clear();
            context.read<RecipeCubit>().emitState(category);
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 64),
          child: Column(
            children: [
              const WelcomingBar(),
              Search(
                controller: controller,
                onchange: (value) {
                  context
                      .read<ItemCubit>()
                      .change(context.read<ItemCubit>().category, value);
                },
              ),
              const Catigories(),
              const Expanded(child: RecipeCardGen()),
            ],
          ),
        ),
      ),
    );
  }
}
