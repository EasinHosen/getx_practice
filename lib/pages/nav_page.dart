import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavePage extends StatelessWidget {
  const NavePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/state_test_page',
                    arguments: {'data': 'some data'});
              },
              child: const Text('Next page'),
            ),
          ],
        ),
      ),
    );
  }
}
