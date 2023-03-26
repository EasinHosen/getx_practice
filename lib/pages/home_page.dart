import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

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
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  'Snackbar',
                  'This is a snackbar with getx',
                  snackPosition: SnackPosition.BOTTOM,
                  borderRadius: 30,
                  margin: const EdgeInsets.all(10),
                  borderColor: Colors.black38,
                  borderWidth: 1,
                  icon: const Icon(Icons.send),
                  onTap: (val) {
                    print('Sb clicked');
                  },
                  overlayBlur: 2,
                  // showProgressIndicator: true,
                );
              },
              child: const Text('Show SB'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  title: 'Alert dialog',
                  middleText: 'Showing alert dialog',
                  // content: //or this can be used
                  // actions:
                  textConfirm: 'yes',
                  textCancel: 'no',
                  onConfirm: () {
                    print('Confirmed');
                    Get.back();
                  },
                  onCancel: () {
                    print('Canceled');
                    Get.back();
                  },
                  barrierDismissible: false,
                );
              },
              child: const Text('Show dialog'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  Wrap(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.wb_sunny_outlined),
                        title: const Text('Light theme'),
                        onTap: () => Get.changeTheme(
                          ThemeData.light(),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.wb_sunny_rounded),
                        title: const Text('Dark theme'),
                        onTap: () => Get.changeTheme(
                          ThemeData.dark(),
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.black38,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      width: 1,
                    ),
                  ),
                  // enableDrag: false,
                );
              },
              child: const Text('Bottom sheet'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/nav_page');
              },
              child: const Text('Nav page'),
            ),
            ElevatedButton(
                onPressed: () async {
                  final lpos = await Geolocator.getLastKnownPosition();
                  print(lpos);
                },
                child: const Text('last pos')),
            ElevatedButton(
                onPressed: () async {
                  final cpos = await Geolocator.getCurrentPosition();
                  print(cpos);
                },
                child: const Text('current pos')),
          ],
        ),
      ),
    );
  }
}
