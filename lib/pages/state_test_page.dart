import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controllers/count_controller.dart';
import 'package:led_bulb_indicator/led_bulb_indicator.dart';

class StateTestPage extends StatelessWidget {
  const StateTestPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;
    print(data);

    CountController countController = Get.put(CountController());

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data['data']),
            const SizedBox(
              height: 10,
            ),
            GetBuilder<CountController>(
              init: CountController(),
              builder: (controller) =>
                  Text('Counter value = ${controller.getCount()}'),
            ),
            // Obx(
            //   () => Text('Counter value = ${countController.getCount()}'),
            // ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => countController.increment(),
              child: const Text('Increment'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => countController.decrement(),
              child: const Text('Decrement'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => countController.reset(),
              child: const Text('Reset'),
            ),
            ElevatedButton(
              onPressed: () {
                countController.ledToggle();
                print(countController.getToggleVal());
              },
              child: Text(countController.getToggleVal() ? 'true' : 'false'),
            ),
            LedBulbIndicator(
              initialState: countController.toggle
                  ? LedBulbColors.green
                  : LedBulbColors.red,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
