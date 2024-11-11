import 'package:after_school_app/common/widgets/app_bar.dart';
import 'package:after_school_app/pages/home/view/widget/home_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/widgets/search_widgets.dart';
import '../home/home_controller.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late PageController _controller;

  @override
  void didChangeDependencies() {
    _controller = PageController(initialPage: ref.watch(homeScreenBannerDotsProvider)); //It is better to initialise the PageController from the clas not widget
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Home",),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HelloText(),
              const UserName(),
              const SizedBox(height: 20,),
              searchBar(),
              const SizedBox(height: 20,),
              HomeBanner(ref: ref, controller: _controller),
              const SizedBox(height: 20,),
              //for showing 3 dots
            ],
          ),
        ),

      ),
    );
  }
}
