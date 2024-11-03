import 'package:after_school_app/common/routes/routes.dart';
import 'package:after_school_app/pages/application/view/application.dart';
import 'package:after_school_app/pages/sign_in/view/sign_in.dart';
import 'package:after_school_app/pages/sign_up/view/sign_up.dart';
import 'package:after_school_app/pages/welcome/view/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/utils/app_styles.dart';
import 'global.dart';

void main() async {

  await Global.init();
  runApp(const ProviderScope(child: MyApp()));
}

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.appThemeData,
      debugShowCheckedModeBanner: false,
      navigatorKey: navKey,
      onGenerateRoute: AppPages.generateRouteSettings,
   //   home: Welcome(), //iniitial route
    );
  }
}

final appCount = StateProvider<int>((ref){
  return 1;
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(appCount);
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Riverpod Basics"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$count',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: "one",
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute
                (builder: (BuildContext context) => const SecondPage()));
            },
            tooltip: 'Navigate to second screen',
            child: const Icon(Icons.arrow_right_rounded),
          ),
          FloatingActionButton(
            heroTag: "two",
            onPressed: (){
              ref.read(appCount.notifier).state--;
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      )
    );
  }
}

class SecondPage extends ConsumerWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(appCount);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text(
            "Count value: $count",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        )

      ),
    );
  }
}
