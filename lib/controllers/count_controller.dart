import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CountController extends GetxController {
  int _count = 0;
  bool toggle = false;

  void increment() {
    _count += 1;
    update();
  }

  void decrement() {
    _count -= 1;
    update();
  }

  void reset() {
    _count = 0;
    update();
  }

  getCount() {
    return _count;
  }

  ledToggle() {
    // GetStorage().write('toggle', value);
    toggle = !toggle;
    update();
  }

  bool getToggleVal() {
    // return GetStorage().read('toggle') ?? false;
    return toggle;
  }
}
