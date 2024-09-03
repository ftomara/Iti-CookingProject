import 'package:cooking_app/gen/assets.gen.dart';
import 'package:cooking_app/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBar extends StatefulWidget
{
   const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
   int _index = 0;

 

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [ BoxShadow(
          
            color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
            spreadRadius: 2, // How much the shadow spreads
            blurRadius: 4, // How much the shadow is blurred
            offset: const Offset(3, 0), // Position of the shadow (x, y)
     
      ),]

      ),
     
      child: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
       
        type: BottomNavigationBarType.fixed,
      backgroundColor: MyColors.butterycolor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: 
      [BottomNavigationBarItem(icon:SvgPicture.asset(
              const $AssetsImagesGen().home,
             colorFilter: ColorFilter.mode(
                _index == 0 ? MyColors.orangecolor : MyColors.greycolor,
                BlendMode.srcIn,
              ) ,
            ),
            label: 'Home'),
            BottomNavigationBarItem(icon:SvgPicture.asset(
              const $AssetsImagesGen().chef,
           colorFilter: ColorFilter.mode(
                _index == 1 ? MyColors.orangecolor : MyColors.greycolor,
                BlendMode.srcIn,
              ) ,
            ), label: 'Explore'),
            BottomNavigationBarItem(icon:SvgPicture.asset(
              const $AssetsImagesGen().plus,
             colorFilter: ColorFilter.mode(
                _index == 2? MyColors.orangecolor : MyColors.greycolor,
                BlendMode.srcIn,
              ) ,
            ), label: 'Add'),
            BottomNavigationBarItem(icon:SvgPicture.asset(
              const $AssetsImagesGen().heart,
              colorFilter: ColorFilter.mode(
                _index == 3 ? MyColors.orangecolor : MyColors.greycolor,
                BlendMode.srcIn,
              ) ,
            ), label: 'Favourite'),
            BottomNavigationBarItem(icon:SvgPicture.asset(
              const $AssetsImagesGen().iconProfileFill,
              colorFilter: ColorFilter.mode(
                _index == 4 ? MyColors.orangecolor : MyColors.greycolor,
                BlendMode.srcIn,
              ) ,
             
            ), 
            label: 'Profile')
            ],
      
       ),
    );
  }
}