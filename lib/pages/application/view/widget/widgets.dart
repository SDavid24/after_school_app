import 'package:after_school_app/common/utils/colors.dart';
import 'package:after_school_app/common/utils/image_res.dart';
import 'package:after_school_app/common/widgets/image_widget.dart';
import 'package:flutter/material.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: _bottomContainer(),
    activeIcon: _bottomContainer(color: AppColors.primaryElement
    ),
    label: "Home",
    backgroundColor: AppColors.primaryBackground

  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.search,),
    activeIcon: _bottomContainer(imagePath: ImageRes.search , color: AppColors.primaryElement
 ),
    label: "Search",
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.play,),
    activeIcon: _bottomContainer(imagePath: ImageRes.play, color: AppColors.primaryElement
    ),
    label: "Play",
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.message,),
    activeIcon: _bottomContainer(imagePath: ImageRes.message, color: AppColors.primaryElement
    ),
    label: "Message",
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.profilePhoto,),
    activeIcon: _bottomContainer(imagePath: ImageRes.profilePhoto, color: AppColors.primaryElement
    ),
    label: "Profile",
  ),
];

Widget _bottomContainer({
  String imagePath = "assets/icons/home.png",
  double width = 15,
  double height = 15,
  Color color = AppColors.primaryFourElementText,
}){
  return SizedBox(
    width: width,
    height: height,
    child: appImageWithColor(imagePath: imagePath,
      color: color,
    ),
  );
}

Widget appScreens(int index){
  List<Widget> _screens = [
    Center(child: appImageWithColor( imagePath: ImageRes.defaultImage, width: 250, height: 250, color: AppColors.primaryElement,),),
    Center(child: appImageWithColor(imagePath: ImageRes.search , width: 250, height: 250,color: AppColors.primaryElement, ),),
    Center(child: appImageWithColor(imagePath: ImageRes.play, width: 250, height: 250, color: AppColors.primaryElement,),),
    Center(child: appImageWithColor(imagePath: ImageRes.message, width: 250, height: 250, color: AppColors.primaryElement,),),
    Center(child: appImageWithColor(imagePath: ImageRes.profilePhoto , width: 250, height: 250, color: AppColors.primaryElement,),),
  ];
  return _screens[index];
}