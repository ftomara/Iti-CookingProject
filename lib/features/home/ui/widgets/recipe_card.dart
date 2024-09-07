import 'package:cooking_app/core/themes/my_text_style.dart';
import 'package:cooking_app/features/home/logic/id_recipe.dart';
import 'package:cooking_app/features/home/model/recipe_api.dart';
import 'package:cooking_app/gen/assets.gen.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../screens/cooking_instructions_screen.dart';

class RecipeCard extends StatefulWidget {
  const RecipeCard({super.key, required this.result});
  final Result result;

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
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
          child: //Stack(
              // children: [
              Padding(
            padding: const EdgeInsets.all(18),
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
                      return const Icon(Icons
                          .error); // Display an error icon or a placeholder
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
                              .withOpacity(0.5), // Shadow color with opacity
                          spreadRadius: 0, // How much the shadow spreads
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

                // Positioned(
                //   top: 4, // 20 from the top
                //   right: 8, // 20 from the right
                //   child: IconButton(
                //     onPressed: () {
                //       setState(() {
                //         // Toggle favorite state here
                //       });
                //     },
                //     icon: SvgPicture.asset(
                //       const $AssetsImagesGen().filledHeart,
                //       colorFilter: ColorFilter.mode(
                //         MyColors.butterycolor,
                //         BlendMode.srcIn,
                //       ),
                //       width: 16, // Adjust width as needed
                //       height: 16, // Adjust height as needed
                //     ),
                //   ),
                // ),
                //   ],
                // ),
              ],
            ),
          ),
          // Positioned(
          //   top: 4, // 20 from the top
          //   right: 8, // 20 from the right
          //   child: IconButton(
          //     onPressed: () {
          //       setState(() {
          //         // Toggle favorite state here
          //       });
          //     },
          //     icon: SvgPicture.asset(
          //       const $AssetsImagesGen().filledHeart,
          //       colorFilter: ColorFilter.mode(
          //         MyColors.butterycolor,
          //         BlendMode.srcIn,
          //       ),
          //       width: 16, // Adjust width as needed
          //       height: 16, // Adjust height as needed
          //     ),
          //   ),
          // ),
          //   ],
          // ),
        ),
      ],
    );
  }
}

          //   child: Row(
        //     children: [
        //       ClipRRect(
        //           borderRadius: BorderRadius.circular(12),
        //           child: Image.network(
        //             widget.result.image!,
        //             width: 90,
        //             height: 90,
        //             errorBuilder: (context, error, stackTrace) {
        //               return const Icon(Icons
        //                   .error); // Display an error icon or a placeholder
        //             },
        //           ),),
        //       const SizedBox(
        //         width: 8,
        //       ),
        //       Expanded(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           children: [
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Container(
        //                       width: 160
        //                           .w, // Makes the container take the full width
        //                       child: Text(
        //                         widget.result.title!,
        //                         maxLines: 1,
        //                         overflow: TextOverflow.ellipsis,
        //                         style: MyTextStyle.recipe_title,
        //                       ),
        //                     )
        //                     // Text(
        //                     //   widget.recipe.chef,
        //                     //   style: MyTextStyle.recipe_author,
        //                     // ),
        //                   ],
        //                 ),
        //                 // IconButton(
        //                 //   onPressed: () {
        //                 //     setState(() {
        //                 //       widget.result.isFav = !widget.result.isFav;
        //                 //     });
        //                 //   },
        //                 //   icon: SvgPicture.asset(
        //                 //     widget.result.isFav
        //                 //         ? const $AssetsImagesGen().filledHeart
        //                 //         : const $AssetsImagesGen().heart,
        //                 //     colorFilter: ColorFilter.mode(
        //                 //       widget.result.isFav == false
        //                 //           ? MyColors.butterycolor
        //                 //           : MyColors.butterycolor,
        //                 //       BlendMode.srcIn,
        //                 //     ),
        //                 //     width: 20, // Adjust width as needed
        //                 //     height: 20, // Adjust height as needed
        //                 //   ),
        //                 // ),
        //               ],
        //             ),
        //             const SizedBox(height: 4),
        //             // Row(
        //             //   children: [
        //             //     SvgPicture.asset(
        //             //       const $AssetsImagesGen().timer,
        //             //       width: 12, // Adjust width as needed
        //             //       height: 12, // Adjust height as needed
        //             //     ),
        //             //     SizedBox(
        //             //       width: 4.w,
        //             //     ),
        //             //     Text(
        //             //       '${widget.result.calories} Mins',
        //             //       style: MyTextStyle.recipe_time,
        //             //     ),
        //             //     SizedBox(
        //             //       width: 8.w,
        //             //     ),
        //             //     SvgPicture.asset(
        //             //       const $AssetsImagesGen().calories,
        //             //       width: 12, // Adjust width as needed
        //             //       height: 12, // Adjust height as needed
        //             //     ),
        //             //     SizedBox(
        //             //       width: 4.w,
        //             //     ),
        //             //     Text(
        //             //       '${widget.result.calories} C',
        //             //       style: MyTextStyle.recipe_time,
        //             //     ),
        //             //   ],
        //             // ),
        //             const SizedBox(height: 8),
        //             // Row(
        //             //   children: List.generate(
        //             //     5,
        //             //     (index) {
        //             //       return widget.recipe.rate > index
        //             //           ? SvgPicture.asset(
        //             //               const $AssetsImagesGen().filledStar,
        //             //               width: 12, // Adjust width as needed
        //             //               height: 12, // Adjust height as needed
        //             //             )
        //             //           : SvgPicture.asset(
        //             //               const $AssetsImagesGen().star,
        //             //               width: 12, // Adjust width as needed
        //             //               height: 12, // Adjust height as needed
        //             //             );
        //             //     },
        //             //   ),
        //             // ),
        //             Expanded(
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.end,
        //                 children: [
        //                   GestureDetector(
        //                     onTap: () {
        //                       // Navigator.push(
        //                       //   context,
        //                       //   MaterialPageRoute(
        //                       //     builder: (context) =>
        //                       //         CookingInstructionsScreen(
        //                       //             recipe: widget.recipe),
        //                       //   ),
        //                       // );
        //                     },
        //                     child: Container(
        //                       width: 108.w,
        //                       height: 28.h,
        //                       decoration: BoxDecoration(
        //                         color: MyColors.butterycolor,
        //                         borderRadius: BorderRadius.circular(8),
        //                         boxShadow: [
        //                           BoxShadow(
        //                             color: const Color.fromARGB(
        //                                     255, 40, 40, 40)
        //                                 .withOpacity(
        //                                     0.5), // Shadow color with opacity
        //                             spreadRadius:
        //                                 0, // How much the shadow spreads
        //                             blurRadius:
        //                                 2, // How much the shadow is blurred
        //                             offset: const Offset(0, 2),
        //                           )
        //                         ],
        //                       ),
        //                       child: Center(
        //                           child: Text(
        //                         "Cook",
        //                         style: MyTextStyle.cook,
        //                       )),
        //                     ),
        //                   )
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // // child: Stack(children: [
        //   Positioned(
        //     left: 16,
        //     top: 16,
        //     child: ClipRRect(
        //       borderRadius: BorderRadius.circular(12),
        //       child: Image.asset(
        //         widget.recipe.impPath,
        //         width: 80,
        //         height: 112,
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   ),
        //   Positioned(
        //       right: 16,
        //       top: 12,
        //       child: IconButton(
        //         onPressed: () {
        //           setState(() {
        //             widget.recipe.isFav = !widget.recipe.isFav;
        //           });
        //         },
        //         icon: SvgPicture.asset(
        //           widget.recipe.isFav
        //               ? const $AssetsImagesGen().filledHeart
        //               : const $AssetsImagesGen().heart,
        //           colorFilter: ColorFilter.mode(
        //             widget.recipe.isFav == false
        //                 ? MyColors.butterycolor
        //                 : MyColors.butterycolor,
        //             BlendMode.srcIn,
        //           ),
        //           width: 20, // Adjust width as needed
        //           height: 20, // Adjust height as needed
        //         ),
        //       )),
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       SizedBox(
        //         width: 42.w,
        //       ),
        //       Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //         SizedBox(
        //           height: 24.h,
        //         ),
        //         Text(
        //           widget.recipe.title,
        //           style: MyTextStyle.recipe_title,
        //         ),
        //         Text(
        //           widget.recipe.chef,
        //           style: MyTextStyle.recipe_author,
        //         ),
        //         SizedBox(
        //           height: 8.h,
        //         ),
        //         Row(
        //           children: [
        //             Row(
        //               children: [
        //                 SvgPicture.asset(
        //                   const $AssetsImagesGen().timer,
        //                   width: 12, // Adjust width as needed
        //                   height: 12, // Adjust height as needed
        //                 ),
        //                 SizedBox(
        //                   width: 4.w,
        //                 ),
        //                 Text(
        //                   widget.recipe.time.toString(),
        //                   style: MyTextStyle.recipe_time,
        //                 ),
        //                 SizedBox(
        //                   width: 8.w,
        //                 ),
        //                 SvgPicture.asset(
        //                   const $AssetsImagesGen().calories,
        //                   width: 12, // Adjust width as needed
        //                   height: 12, // Adjust height as needed
        //                 ),
        //                 SizedBox(
        //                   width: 4.w,
        //                 ),
        //                 Text(
        //                   widget.recipe.calories.toString(),
        //                   style: MyTextStyle.recipe_time,
        //                 ),
        //               ],
        //             )
        //           ],
        //         ),
        //         SizedBox(
        //           height: 6.h,
        //         ),
        //         Row(
        //             children: List.generate(5, (index) {
        //           return SvgPicture.asset(
        //             const $AssetsImagesGen().filledStar,
        //             width: 12, // Adjust width as needed
        //             height: 12, // Adjust height as needed
        //           );
        //         })),
        //       ])
        //     ],
        //   ),
        //   Positioned(
        //       left: 190,
        //       top: 100,
        //       child: GestureDetector(
        //         onTap: () {},
        //         child: Container(
        //           width: 108.w,
        //           height: 28.h,
        //           decoration: BoxDecoration(
        //             color: MyColors.butterycolor,
        //             borderRadius: BorderRadius.circular(8),
        //             boxShadow: [
        //               BoxShadow(
        //                 color: const Color.fromARGB(255, 40, 40, 40)
        //                     .withOpacity(0.5), // Shadow color with opacity
        //                 spreadRadius: 0, // How much the shadow spreads
        //                 blurRadius: 2, // How much the shadow is blurred
        //                 offset: const Offset(0, 2),
        //               )
        //             ],
        //           ),
        //           child: Center(
        //               child: Text(
        //             "Cook",
        //             style: MyTextStyle.cook,
        //           )),
        //         ),
        //       )),
        // ]),
