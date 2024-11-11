import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/utils/colors.dart';
import '../../../../common/utils/image_res.dart';
import '../../../../common/widgets/text_widgets.dart';
import '../../../../global.dart';
import '../../home/home_controller.dart';

class HelloText extends StatelessWidget {
  const HelloText({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24Normal(
        text: "Hello,",
        color: AppColors.primaryThreeElementText,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24Normal(
        text: Global.storageService.getUserProfile().name!,
        //color: AppColors.primaryThreeElementText,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class HomeBanner extends StatelessWidget {
  final WidgetRef ref;
  final PageController controller;
  const HomeBanner({super.key, required this.ref, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 325,
          height: 160,
          child: PageView(
            onPageChanged: (value){
              ref.read(homeScreenBannerDotsProvider.notifier).changeValue(value);
            },
            controller: controller,
            children: [
              bannerContainer(imagePath: ImageRes.banner1),
              bannerContainer(imagePath: ImageRes.banner2),
              bannerContainer(imagePath: ImageRes.banner3),          ],
          ),
        ),

        const SizedBox(height: 20),

        DotsIndicator(
          dotsCount: 3,
          position: ref.watch(homeScreenBannerDotsProvider),
          mainAxisAlignment: MainAxisAlignment.center,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(24.0, 8.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
            ),
          ),
        ),
      ],
    );
  }
}


//controls banner image
Widget bannerContainer({String imagePath = 'assets/icons/Art.png'}){
  return Container(
    width: 325,
    height: 160,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.fill
      ),
    ),
  );
}

