import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_practice/pages/home_page.dart';
import 'package:getx_practice/pages/nav_page.dart';
import 'package:getx_practice/pages/state_test_page.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Snack bar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/home_page',
      getPages: [
        GetPage(
          name: '/home_page',
          page: () => const HomePage(title: 'Getx test'),
        ),
        GetPage(
          name: '/nav_page',
          page: () => const NavePage(title: 'Navigation page'),
          transition: Transition.zoom,
        ),
        GetPage(
          name: '/state_test_page',
          page: () => const StateTestPage(title: 'State test'),
        ),
      ],
    );
  }
}
