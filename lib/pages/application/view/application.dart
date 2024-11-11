import 'package:after_school_app/common/utils/colors.dart';
import 'package:after_school_app/common/widgets/app_bar.dart';
import 'package:after_school_app/common/widgets/app_shadows.dart';
import 'package:after_school_app/pages/application/provider/application_nav_notifier.dart';
import 'package:after_school_app/pages/application/view/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class Application extends ConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var navIndex = ref.watch(applicationNavIndexProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          //appBar: buildAppBar(title: "Home Page"),
          body: appScreens(navIndex),
          bottomNavigationBar: Container (
            width: 375,
            height: 58,
            decoration: appBoxShadowWithRadius(),
            child: BottomNavigationBar(
              currentIndex: navIndex,
              onTap: (value){
                ref.read(applicationNavIndexProvider.notifier).changeIndex(value);
              },

              elevation: 0,
              items: bottomTabs,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false ,
            ),
            ),
          ),
        ),
      );
  }
}
