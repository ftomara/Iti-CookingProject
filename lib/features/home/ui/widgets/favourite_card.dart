import 'package:cooking_app/core/network/firebase/favourite.dart';
import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/features/home/logic/id_recipe.dart';
import 'package:cooking_app/features/home/model/recipe_info.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/cooking_instructions_screen.dart';

class FavouriteCard extends StatefulWidget {
  const FavouriteCard({super.key, required this.result});
  final RecipeInfo result;

  @override
  State<FavouriteCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<FavouriteCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Container(
          height: 232.h,
          width: 164.w,
          decoration: BoxDecoration(
            color: MyColors.orangecolor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(18.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        widget.result.image!,
                        width: 112.w,
                        height: 112.h,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      widget.result.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: MyTextStyle.recipe_title,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<IdRecipe>().setId(widget.result.id!);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CookingInstructionsScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 108.w,
                        height: 28.h,
                        decoration: BoxDecoration(
                          color: MyColors.butterycolor,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 40, 40, 40)
                                  .withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 2,
                              offset: const Offset(0, 2),
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Cook",
                            style: MyTextStyle.cook,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -9,
                right: -8,
                child: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: MyColors.butterycolor,
                  ),
                  onPressed: () {
                    FavouriteImp().removeFromUI(widget.result, context);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
