import 'package:after_school_app/pages/welcome/view/widgets/welcome_widgets.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/welcome_notifier.dart';


class Welcome extends ConsumerWidget {

  Welcome({super.key});


  final PageController _controller = PageController();

 //Monitors the page view index to know which page we are on
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: const EdgeInsets.only(top: 30.0),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                //Showing our 3 welcome pages
                PageView(
                  onPageChanged: (value){
                    ref.read(indexDotProvider.notifier).changeValue(value);
                  },
                  controller: _controller,
                  children: [
                    //first page
                    appOnboardingPage(_controller, index: 1, context),
                    appOnboardingPage( _controller, context,
                      imagePath: "assets/images/man.png",
                      title: "Connect with everyone",
                      subTitle: "Always keep in touch with your tutor and friends. Let's get connected" ,
                      index: 2,
                    ),
                    appOnboardingPage( _controller, context,
                      imagePath: "assets/images/boy.png",
                      title: "Always Fascinated learning",
                      subTitle: "Anywhere, anytime. Learning time is at your discretion",
                      index: 3,
                    ),
                  ],
                ),
              //for showing 3 dots
                Positioned(
                  bottom: 170,
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: index,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(24.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    ),
                  ),

                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
